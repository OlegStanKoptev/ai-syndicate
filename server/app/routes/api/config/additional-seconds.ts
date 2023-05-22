import type { LoaderFunction } from "@remix-run/server-runtime";
import { getAdditionalSeconds } from "~/utils.server";

export const loader: LoaderFunction = async ({ request }) => {
  const additionalSeconds = await getAdditionalSeconds();
  return additionalSeconds;
};
