import type { AppData, LoaderFunction } from "@remix-run/node";
import type { RouteMatch } from "@remix-run/react";
import { useCatch, Outlet, Link } from "@remix-run/react";
import invariant from "tiny-invariant";
import { ExpectedError } from "~/components";
import { db } from "~/db.server";
import { requireCurrentAdmin } from "~/utils.server";
import { deserialize, serialize } from "~/utils";

type LoaderData = {
  startup: {
    name: string;
  };
};

export const loader: LoaderFunction = async ({ request, params }) => {
  const { startupId } = params;
  invariant(startupId);
  await requireCurrentAdmin(request);
  const startup = await db.startup.findUnique({
    where: { id: startupId },
    select: { name: true },
  });
  if (!startup) {
    throw new Response(`Startup with this id: ${startupId} not found`, {
      status: 404,
    });
  }
  return new Response(serialize<LoaderData>({ startup }));
};

export const handle = {
  breadcrumb: (match: RouteMatch & { data: AppData }) => {
    const { startupId } = match.params;
    const data = deserialize<LoaderData>(match.data as string | undefined);
    return data ? (
      <Link to={`/admin/startups/${startupId}`}>{data.startup.name}</Link>
    ) : (
      "?"
    );
  },
};

export default function Startup() {
  return <Outlet />;
}

export function CatchBoundary() {
  const caught = useCatch();
  switch (caught.status) {
    case 404: {
      return (
        <ExpectedError className="m-4">
          <p>{caught.data}</p>
          <Link to="/admin/startups" className="text-blue-300">
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
