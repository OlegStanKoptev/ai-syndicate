import type { User } from "@prisma/client";
import type { LoaderFunction } from "@remix-run/node";
import { Link, useLoaderData } from "@remix-run/react";
import { deserialize, serialize } from "~/utils";
import { getCurrentAdmin } from "~/utils.server";

type LoaderData = {
  admin: User | null;
};

export const loader: LoaderFunction = async ({ request }) => {
  const admin = await getCurrentAdmin(request);
  return serialize<LoaderData>({ admin });
};

export default function HomePage() {
  const data = deserialize<LoaderData>(useLoaderData());
  return (
    <main className="m-5">
      <h1 className="text-xl">
        <span className="font-bold">Welcome</span> to AI Syndicate{" "}
        <span className="font-bold">Admin Panel</span>!
      </h1>
      <p className="mt-5 text-lg mb-3">Here you can administrate the system.</p>
      {data.admin ? (
        <p className="text-base">
          See the{" "}
          <Link to="spec" className="text-blue-400">
            API
          </Link>
        </p>
      ) : (
        <p className="text-base">
          <Link to="login" className="text-blue-400">
            Log in
          </Link>{" "}
          to the system
        </p>
      )}
    </main>
  );
}
