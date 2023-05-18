import type { LoaderFunction, MetaFunction } from "@remix-run/node";
import { Link } from "@remix-run/react";
import { requireCurrentAdmin } from "~/utils.server";

export const loader: LoaderFunction = async ({ request }) => {
  await requireCurrentAdmin(request);
  if (process.env.NODE_ENV !== "development") {
    throw new Response("Playground page only exists in development", {
      status: 404,
    });
  }
  return new Response("");
};

export const handle = {
  breadcrumb: () => <Link to="playground">Playground</Link>,
};

export const meta: MetaFunction = () => {
  return {
    title: "AI Syndicate (admin) | Playground",
  };
};

export default function Playground() {
  return (
    <div className="m-4 flex flex-col gap-4">
      <h1 className="text-xl">Playground route (only exists in development)</h1>
    </div>
  );
}
