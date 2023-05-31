import type { LoaderFunction } from "@remix-run/server-runtime";
import { db } from "~/db.server";
import { requireCurrentApiUser } from "~/utils.server";

export const loader: LoaderFunction = async ({ request }) => {
  const user = await requireCurrentApiUser(request);
  const userInfo = await db.user.findUnique({
    where: { id: user.id },
    include: {
      votesReport: {
        orderBy: { updatedAt: "desc" },
        include: { report: { include: { startup: true } } },
      },
      applicationsDeveloper: {
        orderBy: { updatedAt: "desc" },
        include: { startup: true },
      },
      createdBy: true,
      startupsCreated: { orderBy: { updatedAt: "desc" } },
      votesNewStartup: {
        orderBy: { updatedAt: "desc" },
        include: { startup: true },
      },
      investments: {
        orderBy: { updatedAt: "desc" },
        include: { startup: true },
      },
      deposits: { orderBy: { updatedAt: "desc" } },
      refunds: { orderBy: { updatedAt: "desc" } },
      incomes: { orderBy: { updatedAt: "desc" } },
    },
  });
  return userInfo;
};
