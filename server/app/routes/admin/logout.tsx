import type { ActionFunction, LoaderFunction } from "@remix-run/node";
import { redirect } from "@remix-run/node";
import invariant from "tiny-invariant";
import { commitSession, getSession } from "~/utils.server";

export const action: ActionFunction = async ({ request }) => {
  const data = Object.fromEntries(await request.formData());
  const { redirectTo = "" } = data;
  invariant(typeof redirectTo === "string");
  const session = await getSession(request);
  const search = redirectTo ? `?redirectTo=${redirectTo}` : "";
  session.unset("adminId");
  return redirect(`/admin/login${search}`, {
    headers: {
      "Set-Cookie": await commitSession(session),
    },
  });
};

export const loader: LoaderFunction = async () => {
  throw new Response("", { status: 404 });
};

// For some reason I need this export in order for the root CatchBoundary
// to catch the 404 error
export default function Logout() {
  return null;
}
