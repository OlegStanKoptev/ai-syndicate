import type { SessionStorage } from "@remix-run/node";
import { createCookieSessionStorage, json, redirect } from "@remix-run/node";
import invariant from "tiny-invariant";
import type { ZodEffects, ZodError, ZodSchema } from "zod";
import { z } from "zod";
import { db } from "./db.server";
import { orderByValues } from "./utils";

invariant(process.env.SESSION_SECRET, "SESSION_SECRET must be set");
const USER_SESSION_KEY = "userId";
const sessionStorageAdmin = createCookieSessionStorage({
  cookie: {
    name: "__session_admin",
    httpOnly: true,
    maxAge: 0,
    path: "/",
    sameSite: "none",
    secrets: [process.env.SESSION_SECRET],
    secure: true, //process.env.NODE_ENV === "production",
  },
});
const sessionStorageApiUser = createCookieSessionStorage({
  cookie: {
    name: "__session_api_user",
    httpOnly: true,
    maxAge: 0,
    path: "/",
    sameSite: "none",
    secrets: [process.env.SESSION_SECRET],
    secure: true, //process.env.NODE_ENV === "production",
  },
});

function getSession(request: Request, sessionStorage: SessionStorage) {
  const cookie = request.headers.get("Cookie");
  return sessionStorage.getSession(cookie);
}

export async function loginAdmin(
  request: Request,
  userId: string,
  rememberMe: boolean = false,
  redirectTo?: string
) {
  const session = await getSession(request, sessionStorageAdmin);
  session.set(USER_SESSION_KEY, userId);
  const headers = {
    "Set-Cookie": await sessionStorageAdmin.commitSession(session, {
      maxAge: rememberMe
        ? 60 * 60 * 24 * 7 // 7 days
        : undefined,
    }),
  };
  if (!redirectTo) {
    return new Response(null, { headers });
  }
  return redirect(redirectTo, {
    headers,
  });
}

export async function loginApiUser(
  request: Request,
  userId: string,
  rememberMe: boolean = false
) {
  const session = await getSession(request, sessionStorageApiUser);
  session.set(USER_SESSION_KEY, userId);
  const headers = {
    "Set-Cookie": await sessionStorageApiUser.commitSession(session, {
      maxAge: rememberMe
        ? 60 * 60 * 24 * 7 // 7 days
        : undefined,
    }),
  };
  return new Response(null, { headers });
}

export async function logoutAdmin(request: Request, redirectTo?: string) {
  const session = await getSession(request, sessionStorageAdmin);
  const search = redirectTo ? `?redirectTo=${redirectTo}` : "";
  return redirect(`/admin/login${search}`, {
    headers: {
      "Set-Cookie": await sessionStorageAdmin.destroySession(session),
    },
  });
}

export async function logoutApiUser(request: Request) {
  const session = await getSession(request, sessionStorageApiUser);
  return new Response(null, {
    headers: {
      "Set-Cookie": await sessionStorageApiUser.destroySession(session),
    },
  });
}

async function getCurrentUser(
  request: Request,
  sessionStorage: SessionStorage
) {
  const session = await getSession(request, sessionStorage);
  const userId = session.get(USER_SESSION_KEY);
  if (!userId) {
    return null;
  }
  const user = await db.user.findUnique({ where: { id: userId } });
  if (!user) {
    return null;
  }
  return user;
}

export async function getCurrentAdmin(request: Request) {
  return getCurrentUser(request, sessionStorageAdmin);
}

export async function getCurrentApiUser(request: Request) {
  return getCurrentUser(request, sessionStorageApiUser);
}

export async function requireCurrentAdmin(request: Request) {
  const user = await getCurrentAdmin(request);
  if (!user) {
    throw json({ message: "Authorization error" }, { status: 401 });
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
