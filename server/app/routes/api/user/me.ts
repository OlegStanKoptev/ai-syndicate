import type { LoaderFunction } from "@remix-run/server-runtime";
import { json } from "@remix-run/server-runtime";
import type { User } from "~/utils";
import { parseUser } from "~/utils";
import { requireCurrentUserForApi } from "~/utils.server";

type LoaderData = User;

export const loader: LoaderFunction = async ({ request }) => {
  const user = parseUser(await requireCurrentUserForApi(request));
  return json<LoaderData>(user);
};
