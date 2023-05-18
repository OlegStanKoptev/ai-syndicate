import type { LoaderFunction } from "@remix-run/server-runtime";
import { json } from "@remix-run/server-runtime";
import { requireCurrentApiUser } from "~/utils.server";

export const loader: LoaderFunction = async ({ request }) => {
  const user = await requireCurrentApiUser(request);
  return json(user);
};
