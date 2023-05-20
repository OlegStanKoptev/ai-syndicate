import type { ActionFunction } from "@remix-run/node";
import { commitSession, getSession } from "~/utils.server";

export const action: ActionFunction = async ({ request }) => {
  const session = await getSession(request);
  session.unset("apiUserId");
  return new Response(null, {
    headers: {
      "Set-Cookie": await commitSession(session),
    },
  });
};
