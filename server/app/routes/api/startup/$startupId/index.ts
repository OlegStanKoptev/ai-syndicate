import type { LoaderFunction } from "@remix-run/server-runtime";
import { json } from "@remix-run/server-runtime";
import invariant from "tiny-invariant";
import { db } from "~/db.server";
import type { Startup } from "~/utils";
import { parseStartup } from "~/utils";

type LoaderData = Startup;

export const loader: LoaderFunction = async ({ params }) => {
  const { startupId } = params;
  invariant(typeof startupId === "string");
  const startupData = await db.startup.findUnique({ where: { id: startupId } });
  if (!startupData) {
    return json(
      { message: `Startuper with this id not found: ${startupId}` },
      { status: 404 }
    );
  }
  const startup = parseStartup(startupData);
  return json<LoaderData>(startup);
};
