import type { ActionFunction } from "@remix-run/node";
import { logoutForApi } from "~/utils.server";

export const action: ActionFunction = async ({ request }) => {
  return await logoutForApi(request);
};
