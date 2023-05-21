import type { AppData, LoaderFunction } from "@remix-run/node";
import type { RouteMatch } from "@remix-run/react";
import { useCatch, Outlet, Link } from "@remix-run/react";
import invariant from "tiny-invariant";
import { ExpectedError } from "~/components";
import { db } from "~/db.server";
import { requireCurrentAdmin } from "~/utils.server";
import { deserialize, serialize } from "~/utils";

type LoaderData = {
  applicationNewDeveloper: {
    shortOrgName: string;
  };
};

export const loader: LoaderFunction = async ({ request, params }) => {
  const { applicationNewDeveloperId } = params;
  invariant(applicationNewDeveloperId);
  await requireCurrentAdmin(request);
  const applicationNewDeveloper = await db.applicationNewDeveloper.findUnique({
    where: { id: applicationNewDeveloperId },
    select: { shortOrgName: true },
  });
  if (!applicationNewDeveloper) {
    throw new Response(
      `New developer application with this id: ${applicationNewDeveloperId} not found`,
      {
        status: 404,
      }
    );
  }
  return new Response(serialize<LoaderData>({ applicationNewDeveloper }));
};

export const handle = {
  breadcrumb: (match: RouteMatch & { data: AppData }) => {
    const { applicationNewDeveloperId } = match.params;
    const data = deserialize<LoaderData>(match.data as string | undefined);
    return data ? (
      <Link
        to={`/admin/applications-new-developer/${applicationNewDeveloperId}`}
      >
        {data.applicationNewDeveloper.shortOrgName}
      </Link>
    ) : (
      "?"
    );
  },
};

export default function ApplicationNewDeveloper() {
  return <Outlet />;
}

export function CatchBoundary() {
  const caught = useCatch();
  switch (caught.status) {
    case 404: {
      return (
        <ExpectedError className="m-4">
          <p>{caught.data}</p>
          <Link
            to="/admin/applications-new-developer"
            className="text-blue-300"
          >
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
