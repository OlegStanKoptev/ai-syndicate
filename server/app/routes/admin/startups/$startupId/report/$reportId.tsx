import type { Report, Startup, User, VoteReport } from "@prisma/client";
import type { AppData, LoaderFunction, MetaFunction } from "@remix-run/node";
import type { RouteMatch } from "@remix-run/react";
import { Link, useCatch, useLoaderData } from "@remix-run/react";
import invariant from "tiny-invariant";
import { CardField, ExpectedError, Table, UnexpectedError } from "~/components";
import { db } from "~/db.server";
import { deserialize, serialize, formatDate } from "~/utils";
import { requireCurrentAdmin } from "~/utils.server";

type LoaderData = {
  report: Report & {
    startup: Startup;
    votes: (VoteReport & {
      expert: User;
    })[];
  };
};

export const loader: LoaderFunction = async ({ request, params }) => {
  const { reportId } = params;
  invariant(reportId);
  await requireCurrentAdmin(request);
  const report = await db.report.findUnique({
    where: { id: reportId },
    include: {
      startup: true,
      votes: { orderBy: { updatedAt: "desc" }, include: { expert: true } },
    },
  });
  if (!report) {
    throw new Response(`Report with this id: ${reportId} not found`, {
      status: 404,
    });
  }
  return new Response(serialize<LoaderData>({ report }));
};

export const meta: MetaFunction = (args) => {
  const data = deserialize<LoaderData>(args.data as string | undefined);
  return {
    title: `AI Syndicate (admin) | Report ${
      data ? formatDate(data.report.createdAt, { time: false }) : "?"
    }`,
  };
};

export const handle = {
  breadcrumb: (match: RouteMatch & { data: AppData }) => {
    const { startupId, reportId } = match.params;
    const data = deserialize<LoaderData>(match.data as string | undefined);
    return data ? (
      <Link
        to={`/admin/startups/${startupId}/application-developer/${reportId}`}
      >
        {formatDate(data.report.createdAt, { time: false })}
      </Link>
    ) : (
      "?"
    );
  },
};

export default function ReportIndex() {
  const data = deserialize<LoaderData>(useLoaderData());
  return (
    <div className="m-4">
      <div className="flex items-center gap-4">
        <h1 className="text-xl">
          Report{" "}
          <span className="font-bold">
            {formatDate(data.report.createdAt, { time: false })}
          </span>
        </h1>
      </div>
      <p className="text-base mt-4">This is a report of a startup developer</p>
      <p>
        Report created at{" "}
        {formatDate(data.report.createdAt, {
          time: true,
        })}
      </p>
      <div className="mx-4 my-8 grid grid-cols-2 gap-16">
        <div>
          <CardField name="Startup">
            <Link
              to={`/admin/startups/${data.report.startup.id}`}
              className="text-blue-400"
            >
              {data.report.startup.name}
            </Link>
          </CardField>
          <CardField name="Report file">
            {data.report.reportFile ? (
              <a
                href={`/files/${data.report.reportFile}`}
                target="_blank"
                rel="noreferrer"
                className="text-blue-400"
              >
                {data.report.reportFile}
              </a>
            ) : null}
          </CardField>
        </div>
      </div>
      <h3 className="font-bold text-base mb-4 mt-4">Votes</h3>
      <Table
        data={data.report.votes}
        columns={[
          { id: "id", header: "Id" },
          {
            id: "expert",
            header: "Expert",
            cell: ({ row }) => (
              <Link
                to={`/admin/users/${row.expert.id}`}
                className="text-blue-400"
              >
                {row.expert.fullName} ({row.expert.email})
              </Link>
            ),
            width: 300,
          },
          {
            id: "vote",
            header: "Vote",
            cell: ({ row }) => (row.yea ? "yea" : "nay"),
          },
          { id: "nayReason", header: "Nay reason", width: 500 },
          {
            id: "date",
            header: "Date",
            cell: ({ row }) => formatDate(row.updatedAt, { time: true }),
          },
        ]}
      />
    </div>
  );
}

export function CatchBoundary() {
  const caught = useCatch();
  switch (caught.status) {
    case 409: {
      return (
        <ExpectedError className="m-4">
          <p>{caught.data}</p>
          <Link to="" className="text-blue-300">
            Try again
          </Link>
        </ExpectedError>
      );
    }
    default: {
      throw new Error(`Unhandled error: ${caught.status}`);
    }
  }
}

export function ErrorBoundary({ error }: { error: Error }) {
  console.error(error);
  return (
    <UnexpectedError
      error={error}
      tryAgainElement={
        <Link to="#" className="font-normal text-blue-300">
          Try again
        </Link>
      }
      className="mt-4"
    />
  );
}
