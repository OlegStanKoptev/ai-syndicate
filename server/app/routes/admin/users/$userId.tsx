import type { AppData, LoaderFunction } from "@remix-run/node";
import type { RouteMatch } from "@remix-run/react";
import { useCatch, Outlet, Link } from "@remix-run/react";
import invariant from "tiny-invariant";
import { ExpectedError } from "~/components";
import { db } from "~/db.server";
import { requireCurrentAdmin } from "~/utils.server";
import { deserialize, serialize } from "~/utils";

type LoaderData = {
  user: { email: string };
};

export const loader: LoaderFunction = async ({ request, params }) => {
  const { userId } = params;
  invariant(userId);
  await requireCurrentAdmin(request);
  const user = await db.user.findUnique({
    where: { id: userId },
    select: { fullName: true, email: true },
  });
  if (!user) {
    throw new Response(`User with this id: ${userId} not found`, {
      status: 404,
    });
  }
  return new Response(serialize<LoaderData>({ user }));
};

export const handle = {
  breadcrumb: (match: RouteMatch & { data: AppData }) => {
    const { userId } = match.params;
    const data = deserialize<LoaderData>(match.data as string | undefined);
    return data ? (
      <Link to={`/admin/users/${userId}`}>{data.user.email}</Link>
    ) : (
      "?"
    );
  },
};

export default function User() {
  return <Outlet />;
}

export function CatchBoundary() {
  const caught = useCatch();
  switch (caught.status) {
    case 404: {
      return (
        <ExpectedError className="m-4">
          <p>{caught.data}</p>
          <Link to="/admin/users" className="text-blue-300">
            Go to registry
          </Link>
        </ExpectedError>
      );
    }
    default: {
      throw new Error(`Unhandled error: ${caught.status}`);
    }
  }
}
