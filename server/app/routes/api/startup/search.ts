import type { LoaderFunction } from "@remix-run/server-runtime";
import { json } from "@remix-run/server-runtime";
import { z } from "zod";
import { db } from "~/db.server";
import type { Startup } from "~/utils";
import { parseStartup } from "~/utils";
import { startupStatuses } from "~/utils";

type LoaderData = {
  size: number;
  page: number;
  total: number;
  totalPages: number;
  from: number;
  to: number;
  data: Startup[];
};

const searchSchema = z.object({
  page: z.preprocess(
    (val) => (val ? Number(val) : undefined),
    z.number().int().nonnegative().optional()
  ),
  size: z.preprocess(
    (val) => (val ? Number(val) : undefined),
    z.number().int().nonnegative().optional()
  ),
  status: z.enum(startupStatuses).optional(),
  startuperId: z.string().optional(),
});

export const loader: LoaderFunction = async ({ request }) => {
  const search = Object.fromEntries(new URL(request.url).searchParams);
  const searchValidationResult = searchSchema.safeParse(search);
  if (!searchValidationResult.success) {
    return json(
      { message: "Validation error", zod: searchValidationResult.error },
      { status: 400 }
    );
  }
  const validatedSearch = searchValidationResult.data;
  if (validatedSearch.startuperId) {
    const investor = await db.user.findUnique({
      where: { id: validatedSearch.startuperId },
    });
    if (!investor) {
      return json({
        message: `Startuper with this id not found: ${validatedSearch.startuperId}`,
      });
    }
  }
  const where = {
    status: validatedSearch.status,
    startuperId: validatedSearch.startuperId,
  };
  const total = await db.startup.count({ where });
  const size = validatedSearch.size ?? total;
  const page = validatedSearch.page ?? 0;
  const startupsData = await db.startup.findMany({
    where,
    skip: size * page,
    take: size,
  });
  const startups = startupsData.map(parseStartup);
  return json<LoaderData>({
    size,
    page,
    total,
    totalPages: size > 0 ? Math.ceil(total / size) : 0,
    from: Math.min(total, size * page),
    to: Math.min(total, size * (page + 1)),
    data: startups,
  });
};
