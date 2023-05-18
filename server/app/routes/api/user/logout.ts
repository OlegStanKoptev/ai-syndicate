import type { ActionFunction } from "@remix-run/node";
import { logoutApiUser } from "~/utils.server";

export const action: ActionFunction = async ({ request }) => {
  return await logoutApiUser(request);
};
