import type { ActionFunction, LoaderFunction } from "@remix-run/node";
import invariant from "tiny-invariant";
import { logoutAdmin } from "~/utils.server";

export const loader: LoaderFunction = async () => {
  throw new Response("", { status: 404 });
};

export const action: ActionFunction = async ({ request }) => {
  const data = Object.fromEntries(await request.formData());
  const { redirectTo = "" } = data;
  invariant(typeof redirectTo === "string");
  return await logoutAdmin(request, redirectTo);
};

// For some reason I need this export in order for the root CatchBoundary
// to catch the 404 error
export default function Logout() {
  return null;
}
