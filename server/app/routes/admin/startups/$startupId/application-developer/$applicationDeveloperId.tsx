import type {
  ApplicationDeveloper,
  Startup,
  User,
  VoteDeveloperApplication,
} from "@prisma/client";
import type { AppData, LoaderFunction, MetaFunction } from "@remix-run/node";
import type { RouteMatch } from "@remix-run/react";
import { Link, useCatch, useLoaderData } from "@remix-run/react";
import invariant from "tiny-invariant";
import { CardField, ExpectedError, Table, UnexpectedError } from "~/components";
import { db } from "~/db.server";
import {
  deserialize,
  serialize,
  formatDate,
  isStartupStatusSameOrLaterThan,
} from "~/utils";
import { getVoterWeight, requireCurrentAdmin } from "~/utils.server";

type LoaderData = {
  applicationDeveloper: ApplicationDeveloper & {
    developer: User;
    startup: Startup;
    votes: (VoteDeveloperApplication & {
      voter: User & { weight: number };
    })[];
  };
};

export const loader: LoaderFunction = async ({ request, params }) => {
  const { applicationDeveloperId } = params;
  invariant(applicationDeveloperId);
  await requireCurrentAdmin(request);
  const applicationDeveloper = await db.applicationDeveloper.findUnique({
    where: { id: applicationDeveloperId },
    include: {
      developer: true,
      startup: true,
      votes: { orderBy: { updatedAt: "desc" }, include: { voter: true } },
    },
  });
  if (!applicationDeveloper) {
    throw new Response(
      `Developer application with this id: ${applicationDeveloperId} not found`,
      {
        status: 404,
      }
    );
  }
  return new Response(
    serialize<LoaderData>({
      applicationDeveloper: {
        ...applicationDeveloper,
        votes: await Promise.all(
          applicationDeveloper.votes.map(async (vote) => ({
            ...vote,
            voter: {
              ...vote.voter,
              weight: await getVoterWeight({
                voterId: vote.voter.id,
                startupId: applicationDeveloper.startupId,
              }),
            },
          }))
        ),
      },
    })
  );
};

export const meta: MetaFunction = (args) => {
  const data = deserialize<LoaderData>(args.data as string | undefined);
  return {
    title: `AI Syndicate (admin) | Developer application ${
      data ? data.applicationDeveloper.developer.email : "?"
    }`,
  };
};

export const handle = {
  breadcrumb: (match: RouteMatch & { data: AppData }) => {
    const { startupId, applicationDeveloperId } = match.params;
    const data = deserialize<LoaderData>(match.data as string | undefined);
    return data ? (
      <Link
        to={`/admin/startups/${startupId}/application-developer/${applicationDeveloperId}`}
      >
        {data.applicationDeveloper.developer.email}
      </Link>
    ) : (
      "?"
    );
  },
};

export default function ApplicationDeveloperIndex() {
  const data = deserialize<LoaderData>(useLoaderData());
  return (
    <div className="m-4">
      <div className="flex items-center gap-4">
        <h1 className="text-xl">
          Developer application{" "}
          <span className="font-bold">
            {data.applicationDeveloper.developer.email}
          </span>
        </h1>
      </div>
      <p className="text-base mt-4">
        This is an application of a developer team to participate in certain
        startup development
      </p>
      {isStartupStatusSameOrLaterThan(
        data.applicationDeveloper.startup.status,
        "developerApplication"
      ) ? (
        isStartupStatusSameOrLaterThan(
          data.applicationDeveloper.startup.status,
          "developerVoting"
        ) ? (
          isStartupStatusSameOrLaterThan(
            data.applicationDeveloper.startup.status,
            "developerVoting_succeded"
          ) ? (
            <p className="text-base">The voting has been finished</p>
          ) : (
            <p className="text-base">The voting is in progress...</p>
          )
        ) : (
          <p className="text-base">The voting hasn't started yet</p>
        )
      ) : null}
      <p>
        Application created at{" "}
        {formatDate(data.applicationDeveloper.createdAt, {
          time: true,
        })}
      </p>
      <div className="mx-4 my-8 grid grid-cols-2 gap-16">
        <div>
          <CardField name="Startup">
            <Link
              to={`/admin/startups/${data.applicationDeveloper.startup.id}`}
              className="text-blue-400"
            >
              {data.applicationDeveloper.startup.name}
            </Link>
          </CardField>
          <CardField name="Developer">
            <Link
              to={`/admin/users/${data.applicationDeveloper.developer.id}`}
              className="text-blue-400"
            >
              {data.applicationDeveloper.developer.shortOrgName} (
              {data.applicationDeveloper.developer.email})
            </Link>
          </CardField>
          <CardField name="Voting score">?</CardField>
        </div>
      </div>
      <h3 className="font-bold text-base mb-4 mt-4">Votes</h3>
      <Table
        data={data.applicationDeveloper.votes}
        columns={[
          { id: "id", header: "Id" },
          {
            id: "voter",
            header: "Voter",
            cell: ({ row }) => (
              <Link
                to={`/admin/users/${row.voter.id}`}
                className="text-blue-400"
              >
                {row.voter.id === data.applicationDeveloper.startup.startuperId
                  ? "Startup owner"
                  : "Investor"}{" "}
                ({row.voter.email})
              </Link>
            ),
            width: 300,
          },
          {
            id: "investorWeight",
            header: "Investor weight",
            cell: ({ row }) => `${Math.trunc(row.voter.weight * 100)}%`,
          },
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
