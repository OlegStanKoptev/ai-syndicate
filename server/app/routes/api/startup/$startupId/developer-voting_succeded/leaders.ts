import type { LoaderFunction } from "@remix-run/server-runtime";
import { json } from "@remix-run/server-runtime";
import invariant from "tiny-invariant";
import { db } from "~/db.server";
import { getStartupLeadingApplicationsDeveloper } from "~/utils.server";

export const loader: LoaderFunction = async ({ params }) => {
  const { startupId } = params;
  invariant(typeof startupId === "string");
  const startupData = await db.startup.findUnique({ where: { id: startupId } });
  if (!startupData) {
    return json(
      { message: `Startup with this id not found: ${startupId}` },
      { status: 404 }
    );
  }
  const leaders = await getStartupLeadingApplicationsDeveloper(startupId);
  return leaders;
};
