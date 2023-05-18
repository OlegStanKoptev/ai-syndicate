import type { LoaderFunction } from "@remix-run/server-runtime";
import { json } from "@remix-run/server-runtime";
import { requireCurrentUserForApi } from "~/utils.server";

export const loader: LoaderFunction = async ({ request }) => {
  const user = await requireCurrentUserForApi(request);
  return json(user);
};
