import type { Startup, User, VoteNewStartup } from "@prisma/client";
import type { LoaderFunction, MetaFunction } from "@remix-run/node";
import { Link, useCatch, useLoaderData } from "@remix-run/react";
import invariant from "tiny-invariant";
import {
  CardField,
  ExpectedError,
  ProgressBar,
  Table,
  UnexpectedError,
} from "~/components";
import { db } from "~/db.server";
import {
  deserialize,
  formatDate,
  isStartupStatusSameOrLaterThan,
  serialize,
  startupStatusNames,
  startupVerificationNayThreshold,
  startupVerificationYeaThreshold,
} from "~/utils";
import {
  getNewStartupNaysTotal,
  getNewStartupYeasTotal,
  requireCurrentAdmin,
} from "~/utils.server";

type LoaderData = {
  startup: Startup & {
    startuper: User;
    votesNewStartup: (VoteNewStartup & {
      expert: User;
    })[];
    yeasTotal: number;
    naysTotal: number;
  };
};

export const loader: LoaderFunction = async ({ request, params }) => {
  const { startupId } = params;
  invariant(startupId);
  await requireCurrentAdmin(request);
  const startup = await db.startup.findUnique({
    where: { id: startupId },
    include: {
      startuper: true,
      votesNewStartup: {
        orderBy: { updatedAt: "desc" },
        include: { expert: true },
      },
    },
  });
  if (!startup) {
    throw new Response(`Startup with this id: ${startupId} not found`, {
      status: 404,
    });
  }
  return new Response(
    serialize<LoaderData>({
      startup: {
        ...startup,
        yeasTotal: await getNewStartupYeasTotal(startupId),
        naysTotal: await getNewStartupNaysTotal(startupId),
      },
    })
  );
};

export const meta: MetaFunction = (args) => {
  const data = deserialize<LoaderData>(args.data as string | undefined);
  return {
    title: `AI Syndicate (admin) | Startup «${data ? data.startup.name : "?"}»`,
  };
};

export default function StartupIndex() {
  const data = deserialize<LoaderData>(useLoaderData());
  return (
    <div className="m-4">
      <div className="flex items-center gap-4">
        <h1 className="text-xl">
          Startup <span className="font-bold">{data.startup.name}</span> (
          {startupStatusNames[data.startup.status]})
        </h1>
      </div>
      {data.startup.status === "verification" && (
        <>
          <p className="text-base mt-4">
            Right now <span className="font-bold">experts</span> are deciding
            whether or not this startup is{" "}
            <span className="font-bold">good enough</span>. They are voting
            either 'yea' or 'nay'
          </p>
          <p className="text-base">
            <span className="font-bold">{startupVerificationYeaThreshold}</span>{" "}
            'yeas' is enough for the startup to pass. However, it takes{" "}
            <span className="font-bold">{startupVerificationNayThreshold}</span>{" "}
            'nays' to decline the startup
          </p>
          <p className="text-base mt-4">
            Currently, there are{" "}
            <span className="text-green-600 font-bold">
              {data.startup.yeasTotal}
            </span>{" "}
            'yeas' and{" "}
            <span className="text-red-400 font-bold">
              {data.startup.naysTotal}
            </span>{" "}
            'nays'.
          </p>
        </>
      )}
      {data.startup.status === "verification_succeded" && (
        <>
          <p className="text-base mt-4">
            <span className="font-bold">Experts decided</span> that this startup
            is <span className="font-bold">great</span>, and it is now{" "}
            <span className="font-bold">verified</span>!
          </p>
          <p className="text-base">
            Now it is time for the{" "}
            <Link
              to={`/admin/users/${data.startup.startuperId}`}
              className="text-blue-400"
            >
              startuper
            </Link>{" "}
            to submit this startup to{" "}
            <span className="font-bold">financing</span> stage.
          </p>
        </>
      )}
      {data.startup.status === "verification_failed" && (
        <>
          <p className="text-base mt-4">
            <span className="font-bold">Unfortunately, experts decided</span>{" "}
            that this startup
            <span className="font-bold">does not fit</span> all requirements
          </p>
          <p className="text-base">
            However, the{" "}
            <Link
              to={`/admin/users/${data.startup.startuperId}`}
              className="text-blue-400"
            >
              startuper
            </Link>{" "}
            can consider all the <span className="font-bold">remarks</span> of
            the experts and try to create it again with this one as{" "}
            <span className="font-bold">base</span>
          </p>
        </>
      )}
      <div className="mx-4 mt-8 grid grid-cols-2 gap-16">
        <div>
          <CardField name="Name">{data.startup.name}</CardField>
          <CardField name="Description">{data.startup.description}</CardField>
          <CardField name="Target financing">
            {data.startup.targetFinancing}
          </CardField>
          <CardField name="Status">
            {startupStatusNames[data.startup.status]}
          </CardField>
        </div>
        <div>
          <CardField name="Logo file">
            {data.startup.logoFile ? (
              <a
                href={`/files/${data.startup.logoFile}`}
                target="_blank"
                rel="noreferrer"
                className="text-blue-400"
              >
                {data.startup.logoFile}
              </a>
            ) : null}
          </CardField>
          <CardField name="Specification file">
            <a
              href={`/files/${data.startup.specificationFile}`}
              target="_blank"
              rel="noreferrer"
              className="text-blue-400"
            >
              {data.startup.specificationFile}
            </a>
          </CardField>
          <CardField name="Presentation file">
            {data.startup.presentationFile ? (
              <a
                href={`/files/${data.startup.presentationFile}`}
                target="_blank"
                rel="noreferrer"
                className="text-blue-400"
              >
                {data.startup.presentationFile}
              </a>
            ) : null}
          </CardField>
          <CardField name="Business plan file">
            {data.startup.businessPlanFile ? (
              <a
                href={`/files/${data.startup.businessPlanFile}`}
                target="_blank"
                rel="noreferrer"
                className="text-blue-400"
              >
                {data.startup.businessPlanFile}
              </a>
            ) : null}
          </CardField>
        </div>
        <div>
          <CardField name="Startuper">
            <Link
              className="text-blue-400"
              to={`/admin/users/${data.startup.startuper.id}`}
            >
              {data.startup.startuper.fullName} ({data.startup.startuper.email})
            </Link>
          </CardField>
        </div>
        <div />
        <div>
          <CardField name="Created">
            {formatDate(data.startup.createdAt)}
          </CardField>
          <CardField name="Last updated">
            {formatDate(data.startup.updatedAt)}
          </CardField>
        </div>
      </div>
      {isStartupStatusSameOrLaterThan(data.startup.status, "verification") && (
        <>
          <h2 className="font-bold text-lg mb-4 mt-8">VERIFICATION</h2>
          {data.startup.status === "verification" && (
            <p className="mb-3">Verification in progress...</p>
          )}
          {isStartupStatusSameOrLaterThan(
            data.startup.status,
            "verification_failed"
          ) && (
            <p className="text-red-400 font-bold mb-3">Verification failed</p>
          )}
          {isStartupStatusSameOrLaterThan(
            data.startup.status,
            "verification_succeded"
          ) && (
            <p className="text-green-600 font-bold mb-3">
              Verification succeded
            </p>
          )}
          <div className="flex gap-4 items-center">
            <ProgressBar
              progress={
                (data.startup.yeasTotal / startupVerificationYeaThreshold) * 100
              }
              label={data.startup.yeasTotal}
              className="w-1/2"
              barClassName="bg-green-600"
            />
            <p className="text-base">
              Yeas:{" "}
              <span className="text-green-600 font-bold">
                {data.startup.yeasTotal}
              </span>{" "}
              / {startupVerificationYeaThreshold}
            </p>
          </div>
          <div className="flex gap-4 items-center mt-2">
            <ProgressBar
              progress={
                (data.startup.naysTotal / startupVerificationNayThreshold) * 100
              }
              label={data.startup.naysTotal}
              className="w-1/2"
              barClassName="bg-red-400"
            />
            <p className="text-base">
              Nays:{" "}
              <span className="text-red-400 font-bold">
                {data.startup.naysTotal}
              </span>{" "}
              / {startupVerificationNayThreshold}
            </p>
          </div>
          <h3 className="font-bold text-base mb-4 mt-4">Votes</h3>
          <Table
            data={data.startup.votesNewStartup}
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
        </>
      )}
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
