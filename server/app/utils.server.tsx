import { createCookieSessionStorage, json, redirect } from "@remix-run/node";
import invariant from "tiny-invariant";
import type { ZodEffects, ZodError, ZodSchema } from "zod";
import { z } from "zod";
import { db, reconnectDb } from "./db.server";
import { orderByValues } from "./utils";
import { scheduleJob, gracefulShutdown as cancelAllJobs } from "node-schedule";
import * as dateFns from "date-fns";
import { execSync } from "child_process";

invariant(process.env.SESSION_SECRET, "SESSION_SECRET must be set");
const sessionStorage = createCookieSessionStorage({
  cookie: {
    name: "__session",
    httpOnly: true,
    maxAge: 0,
    path: "/",
    sameSite: "none",
    secrets: [process.env.SESSION_SECRET],
    secure: true, //process.env.NODE_ENV === "production",
  },
});
export function getSession(request: Request) {
  const cookie = request.headers.get("Cookie");
  return sessionStorage.getSession(cookie);
}
export const commitSession = sessionStorage.commitSession;
export const destroySession = sessionStorage.destroySession;

export async function getCurrentAdmin(request: Request) {
  const session = await getSession(request);
  const userId = session.get("adminId");
  if (!userId) {
    return null;
  }
  const user = await db.user.findUnique({ where: { id: userId } });
  if (!user) {
    return null;
  }
  return user;
}

export async function getCurrentApiUser(request: Request) {
  const session = await getSession(request);
  const userId = session.get("apiUserId");
  if (!userId) {
    return null;
  }
  const user = await db.user.findUnique({ where: { id: userId } });
  if (!user) {
    return null;
  }
  return user;
}

export async function requireCurrentAdmin(request: Request) {
  const user = await getCurrentAdmin(request);
  if (!user) {
    const redirectTo = new URL(request.url).pathname;
    const search = redirectTo ? `?redirectTo=${redirectTo}` : "";
    const session = await getSession(request);
    session.unset("adminId");
    throw redirect(`/admin/login${search}`, {
      headers: {
        "Set-Cookie": await commitSession(session),
      },
    });
  }
  return user;
}

export async function requireCurrentApiUser(request: Request) {
  const user = await getCurrentApiUser(request);
  if (!user) {
    throw json({ message: "Authorization error" }, { status: 401 });
  }
  return user;
}

export type FormattedZodError<T> = {
  [Field in keyof (z.typeToFlattenedError<T, string>["fieldErrors"] & {
    submit?: string;
  })]: string;
};

export function formatZodError<T>(error: ZodError<T>): FormattedZodError<T> {
  const flatError = error.flatten();
  const formError = flatError.formErrors[0];
  const fieldErrors = Object.fromEntries(
    Object.entries(flatError.fieldErrors).map(([errorName, errors]) => {
      invariant(Array.isArray(errors));
      return [errorName, errors[0]];
    })
  ) as FormattedZodError<T>;
  if (formError) {
    return { submit: formError, ...fieldErrors };
  }
  return fieldErrors;
}

export function validateSingleParameter<T>({
  value,
  schema,
  throw_,
}: {
  value: any;
  schema: ZodSchema<T> | ZodEffects<ZodSchema<any>, T>;
  throw_: Response;
}) {
  const validationResult = schema.safeParse(value);
  if (!validationResult.success) {
    throw throw_;
  }
  return validationResult.data;
}

export function validateRegistryParams<T extends string>(
  searchParams: URLSearchParams,
  sortKeys: [T, ...T[]]
) {
  const page = validateSingleParameter({
    value: searchParams.get("page"),
    schema: z.preprocess(
      (val) => (val === null ? 0 : Number(val)),
      z.number().int().min(0)
    ),
    throw_: new Response(
      `Parameter page is incorrect: ${searchParams.get("page")}`,
      { status: 400 }
    ),
  });
  const size = validateSingleParameter({
    value: searchParams.get("size"),
    schema: z.preprocess(
      (val) => (val === null ? 10 : Number(val)),
      z.number().int().min(1)
    ),
    throw_: new Response(
      `Parameter size is incorrect: ${searchParams.get("size")}`,
      { status: 400 }
    ),
  });
  const sortKey = validateSingleParameter({
    value: searchParams.get("sortKey"),
    schema: z.enum(sortKeys).nullable(),
    throw_: new Response(
      `Parameter sortKey is incorrect: ${searchParams.get("sortKey")}`,
      { status: 400 }
    ),
  });
  const orderBy =
    validateSingleParameter({
      value: searchParams.get("orderBy"),
      schema: z.enum(orderByValues).nullable(),
      throw_: new Response(
        `Parameter orderBy is incorrect: ${searchParams.get("orderBy")}`,
        { status: 400 }
      ),
    }) ?? "desc";
  return { page, size, sortKey, orderBy };
}

export async function getStartupTotalFinancing(id: string) {
  const investmentAggregation = await db.investment.aggregate({
    where: { startupId: id },
    _sum: { amount: true },
  });
  return investmentAggregation._sum.amount ?? 0;
}

export async function getNewStartupYeasTotal(id: string) {
  const yeasTotal = await db.voteNewStartup.count({
    where: { startupId: id, yea: true },
  });
  return yeasTotal;
}

export async function getNewStartupNaysTotal(id: string) {
  const naysTotal = await db.voteNewStartup.count({
    where: { startupId: id, yea: false },
  });
  return naysTotal;
}

export async function scheduleOrRunJob(date: Date, handle: () => any) {
  if (dateFns.isAfter(date, await newServerDate())) {
    scheduleJob(date, handle);
  } else {
    handle();
  }
}

export function scheduleStartupFinancingDeadline(id: string, deadline: Date) {
  scheduleOrRunJob(deadline, async () => {
    const startup = await db.startup.findUnique({
      where: { id: id },
    });
    if (startup && startup.status === "financing") {
      await db.startup.update({
        where: { id: startup.id },
        data: {
          status: "financing_failed",
          financingEndedAt: deadline,
          updatedAt: await newServerDate(),
        },
      });
      const investments = await db.investment.findMany({
        where: { startupId: startup.id },
      });
      await Promise.all(
        investments.map(async (investment) => {
          await db.user.update({
            where: { id: investment.investorId },
            data: {
              balance: { increment: investment.amount },
              updatedAt: await newServerDate(),
            },
          });
          await db.refund.create({
            data: {
              amount: investment.amount,
              investorId: investment.investorId,
              createdAt: await newServerDate(),
              updatedAt: await newServerDate(),
            },
          });
        })
      );
    }
  });
}

export function scheduleStartupDeveloperApplicationDeadline(
  id: string,
  deadline: Date
) {
  scheduleOrRunJob(deadline, async () => {
    const startup = await db.startup.findUnique({
      where: { id: id },
    });
    if (startup && startup.status === "developerApplication") {
      await db.startup.update({
        where: { id: startup.id },
        data: {
          status: "developerVoting",
          developerApplicationEndedAt: deadline,
          updatedAt: await newServerDate(),
        },
      });
    }
  });
}

async function schedule() {
  const financingStartups = await db.startup.findMany({
    where: { status: "financing" },
  });
  await Promise.all(
    financingStartups.map(async (startup) => {
      invariant(startup.financingDeadline);
      scheduleStartupFinancingDeadline(startup.id, startup.financingDeadline);
    })
  );
  const developerApplicationStartups = await db.startup.findMany({
    where: { status: "developerApplication" },
  });
  await Promise.all(
    developerApplicationStartups.map(async (startup) => {
      invariant(startup.developerApplicationDeadline);
      scheduleStartupDeveloperApplicationDeadline(
        startup.id,
        startup.developerApplicationDeadline
      );
    })
  );
}

declare global {
  var scheduled: boolean | undefined;
}

if (!global.scheduled) {
  schedule();
  global.scheduled = true;
}

export async function clearDb() {
  await db.$disconnect();
  execSync(`npx prisma migrate reset --force`);
  reconnectDb();
}

export async function addSeconds(seconds: number) {
  const { id } = (await db.config.findFirst())!;
  const { additionalSeconds } = await db.config.update({
    where: { id },
    data: {
      additionalSeconds: { increment: seconds },
    },
  });
  await cancelAllJobs();
  await schedule();
  return additionalSeconds;
}

export async function getAdditionalSeconds() {
  const { additionalSeconds } = (await db.config.findFirst())!;
  return additionalSeconds;
}

export async function newServerDate(date?: Date) {
  const additionalSeconds = await getAdditionalSeconds();
  return dateFns.addSeconds(date ?? new Date(), additionalSeconds);
}
