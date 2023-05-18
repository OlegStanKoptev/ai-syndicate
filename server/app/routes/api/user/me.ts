import type { User } from "@prisma/client";
import type { LoaderFunction } from "@remix-run/server-runtime";
import { json } from "@remix-run/server-runtime";
import { requireCurrentUserForApi } from "~/utils.server";

type LoaderData = User;

export const loader: LoaderFunction = async ({ request }) => {
  const user = await requireCurrentUserForApi(request);
  return json<LoaderData>(user);
};
