import type { LoaderFunction } from "@remix-run/server-runtime";
import { json } from "@remix-run/server-runtime";
import invariant from "tiny-invariant";
import { db } from "~/db.server";

export const loader: LoaderFunction = async ({ params }) => {
  const { startupId } = params;
  invariant(typeof startupId === "string");
  const startup = await db.startup.findUnique({ where: { id: startupId } });
  if (!startup) {
    return json(
      { message: `Startup with this id not found: ${startupId}` },
      { status: 404 }
    );
  }
  return json(startup);
};
