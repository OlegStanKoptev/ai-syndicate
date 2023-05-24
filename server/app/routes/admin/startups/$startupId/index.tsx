import type {
  ApplicationDeveloper,
  Investment,
  Report,
  Startup,
  User,
  VoteNewStartup,
} from "@prisma/client";
import type { LoaderFunction, MetaFunction } from "@remix-run/node";
import { Link, useCatch, useLoaderData, useNavigate } from "@remix-run/react";
import invariant from "tiny-invariant";
import {
  CardField,
  ExpectedError,
  ProgressBar,
  Table,
  UnexpectedError,
} from "~/components";
import { db } from "~/db.server";
import { MdEdit } from "react-icons/md";
import {
  deserialize,
  formatDate,
  isStartupStatusSameOrLaterThan,
  reportVerificationYeaThreshold,
  serialize,
  startupStatusNames,
  startupVerificationNayThreshold,
  startupVerificationYeaThreshold,
} from "~/utils";
import {
  getApplicationDeveloperApproval,
  getNewStartupNaysTotal,
  getNewStartupYeasTotal,
  getReportNaysTotal,
  getReportYeasTotal,
  getStartupLeadingApplicationsDeveloper,
  getStartupTotalFinancing,
  newServerDate,
  requireCurrentAdmin,
} from "~/utils.server";
import * as dateFns from "date-fns";

type LoaderData = {
  startup: Startup & {
    startuper: User;
    votesNewStartup: (VoteNewStartup & {
      expert: User;
    })[];
    yeasTotal: number;
    naysTotal: number;
    receivedFinancing: number;
    investments: (Investment & {
      investor: User;
    })[];
    applicationsDeveloper: (ApplicationDeveloper & {
      developer: User;
      approval: number;
    })[];
    applicationsDeveloperCount: number;
    maxApproval: number;
    maxApprovalApplicationsDeveloper: (ApplicationDeveloper & {
      developer: User;
    })[];
    developer: User | null;
    reports: (Report & { yeas: number; nays: number })[];
    isDevelopmentLate: boolean;
  };
};

export const loader: LoaderFunction = async ({ request, params }) => {
  const { startupId } = params;
  invariant(startupId);
  await requireCurrentAdmin(request);
  const startup = await db.startup.findUnique({
    where: { id: startupId },
    include: {
      reports: { orderBy: { updatedAt: "desc" } },
      startuper: true,
      votesNewStartup: {
        orderBy: { updatedAt: "desc" },
        include: { expert: true },
      },
      investments: {
        orderBy: { updatedAt: "desc" },
        include: { investor: true },
      },
      applicationsDeveloper: {
        orderBy: { updatedAt: "desc" },
        include: { developer: true },
      },
      developer: true,
    },
  });
  const maxApprovalData = await getStartupLeadingApplicationsDeveloper(
    startupId
  );
  const { maxApproval } = maxApprovalData;
  const maxApprovalApplicationsDeveloper =
    await db.applicationDeveloper.findMany({
      where: { id: { in: maxApprovalData.ids } },
      include: { developer: true },
    });
  const applicationsDeveloperCount = await db.applicationDeveloper.count({
    where: { startupId },
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
        applicationsDeveloper: await Promise.all(
          startup.applicationsDeveloper.map(async (applicationDeveloper) => ({
            ...applicationDeveloper,
            approval: await getApplicationDeveloperApproval(
              applicationDeveloper.id
            ),
          }))
        ),
        reports: await Promise.all(
          startup.reports.map(async (report) => ({
            ...report,
            yeas: await getReportYeasTotal(report.id),
            nays: await getReportNaysTotal(report.id),
          }))
        ),
        yeasTotal: await getNewStartupYeasTotal(startupId),
        naysTotal: await getNewStartupNaysTotal(startupId),
        receivedFinancing: await getStartupTotalFinancing(startupId),
        applicationsDeveloperCount,
        maxApproval,
        maxApprovalApplicationsDeveloper,
        isDevelopmentLate:
          startup.status === "development" &&
          dateFns.isAfter(await newServerDate(), startup.developmentDeadline!),
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
  const navigate = useNavigate();
  return (
    <div className="m-4">
      <div className="flex items-center gap-4">
        <h1 className="text-xl">
          Startup <span className="font-bold">{data.startup.name}</span> (
          {startupStatusNames[data.startup.status]})
        </h1>
        <Link to="edit">
          <MdEdit
            title="Edit"
            className="h-7 w-7 rounded-full bg-blue-400 fill-white p-1 hover:bg-blue-500"
          />
        </Link>
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
            that this startup <span className="font-bold">does not fit</span>{" "}
            all requirements
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
      {data.startup.status === "financing" && (
        <>
          <p className="text-base mt-4">
            It is time for <span className="font-bold">investors</span> to{" "}
            <span className="font-bold">fund</span> the startup.
          </p>
          <p className="text-base">
            Note that <span className="font-bold">total</span> amount of
            investments <span className="font-bold">cannot exeed</span> the{" "}
            <span className="font-bold">target</span> financing amount of the
            startup
          </p>
          <p className="text-base mt-4">
            Currently,{" "}
            <span className="text-green-600 font-bold">
              {Math.trunc(
                (data.startup.receivedFinancing /
                  data.startup.targetFinancing) *
                  100
              )}
              %
            </span>{" "}
            of target financing is gathered (
            <span className="text-green-600 font-bold">
              {data.startup.receivedFinancing}
            </span>{" "}
            out of {data.startup.targetFinancing})
          </p>
          <p className="text-base mt-4">
            The financing stage will end as soon as{" "}
            <span className="font-bold">target</span> financing is{" "}
            <span className="font-bold">received</span> or{" "}
            <span className="font-bold">time runs out</span>
          </p>
          <p>
            Financing deadline:{" "}
            {formatDate(data.startup.financingDeadline!, { time: true })}
          </p>
        </>
      )}
      {data.startup.status === "financing_failed" && (
        <>
          <p className="text-base mt-4">
            Sadly, the startup <span className="font-bold">failed</span> to
            attract enough <span className="font-bold">investment</span>. But
            the investors got their refunds.
          </p>
          <p className="text-base">
            The{" "}
            <Link
              to={`/admin/users/${data.startup.startuperId}`}
              className="text-blue-400"
            >
              startuper
            </Link>{" "}
            can <span className="font-bold">try again</span> and create a new
            startup with this one as <span className="font-bold">base</span>, or
            they could do so <span className="font-bold">from scratch</span>
          </p>
        </>
      )}
      {data.startup.status === "financing_succeded" && (
        <>
          <p className="text-base mt-4">The startup got its financing!</p>
          <p className="text-base">
            Now the{" "}
            <Link
              to={`/admin/users/${data.startup.startuperId}`}
              className="text-blue-400"
            >
              startuper
            </Link>{" "}
            must <span className="font-bold">confirm transition</span> to
            developer <span className="font-bold">hiring</span> stage and
            specify the <span className="font-bold">deadline</span> for that
          </p>
        </>
      )}
      {data.startup.status === "developerApplication" && (
        <>
          <p className="text-base mt-4">
            This stage is for <span className="font-bold">hiring</span> the most
            fitting <span className="font-bold">developer team</span>.
          </p>
          <p className="text-base">
            Right now there are{" "}
            <span className="font-bold">
              {data.startup.applicationsDeveloperCount}
            </span>{" "}
            applications from different developers
          </p>
          <p>
            Developer application deadline:{" "}
            {formatDate(data.startup.developerApplicationDeadline!, {
              time: true,
            })}
          </p>
        </>
      )}
      {data.startup.status === "developerApplication_succeded" && (
        <>
          <p className="text-base mt-4">
            Developer applications have been received!
          </p>
          <p className="text-base">
            Now the{" "}
            <Link
              to={`/admin/users/${data.startup.startuperId}`}
              className="text-blue-400"
            >
              startuper
            </Link>{" "}
            should <span className="font-bold">confirm</span> that it is time to{" "}
            <span className="font-bold">vote</span> on which one of these{" "}
            <Link to="#developer-application" className="text-blue-400">
              developers
            </Link>{" "}
            will suit us <span className="font-bold">best</span>
          </p>
          <p className="text-base">
            He must also specify developer voting{" "}
            <span className="font-bold">deadline</span>.
          </p>
        </>
      )}
      {data.startup.status === "developerVoting" && (
        <>
          <p className="text-base mt-4"></p>
          <p className="text-base">
            Now startuper and investors can vote on which developers they deem
            appropriate for the goals of this project
          </p>
          <p>
            Developer voting deadline:{" "}
            {formatDate(data.startup.developerVotingDeadline!, {
              time: true,
            })}
          </p>
        </>
      )}
      {data.startup.status === "developerVoting_succeded" && (
        <>
          <p className="text-base mt-4">
            The startuper must <span className="font-bold">choose</span> one of
            the developers that won and move the project on to the stage of
            development
          </p>
          <p>
            Leaders ({data.startup.maxApproval}%):{" "}
            {data.startup.maxApprovalApplicationsDeveloper.map(
              (applicationDeveloper) => (
                <Link
                  to={`/admin/users/${applicationDeveloper.developerId}`}
                  key={applicationDeveloper.id}
                  className="text-blue-400 ml-3"
                >
                  {applicationDeveloper.developer.email}
                </Link>
              )
            )}
          </p>
        </>
      )}
      {data.startup.status === "development" && (
        <>
          <p className="text-base mt-4">
            The startup is in development. In the end, the{" "}
            <Link
              to={`/admin/users/${data.startup.developerId!}`}
              className="text-blue-400"
            >
              developer
            </Link>{" "}
            will file a report that will be checked by experts.
          </p>
          <p className="text-base">
            7 'yeas' make the startup pass the development stage, but 3 'nays'
            mean that the developer needs to improve their work and file a new
            report.
          </p>
          <p>
            Development deadline:{" "}
            {formatDate(data.startup.developmentDeadline!, { time: true })}
          </p>
        </>
      )}
      {data.startup.status === "development_succeded" && (
        <>
          <p className="text-base mt-4">
            This is the last step! The startuper only needs to confirm that the
            project is finished.
          </p>
        </>
      )}
      {data.startup.status === "finished" && (
        <>
          <p className="text-base mt-4">
            The startup is <span className="text-green-600">finished</span>!
          </p>
          <p>
            Finish date: {formatDate(data.startup.finishedAt!, { time: true })}
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
          {isStartupStatusSameOrLaterThan(
            data.startup.status,
            "development"
          ) && (
            <CardField name="Developer">
              <Link
                className="text-blue-400"
                to={`/admin/users/${data.startup.developer!.id}`}
              >
                {data.startup.developer!.fullName} (
                {data.startup.developer!.email})
              </Link>
            </CardField>
          )}
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
      {isStartupStatusSameOrLaterThan(data.startup.status, "development") && (
        <>
          <div id="developer-application" className="relative bottom-5" />
          <h2 className="font-bold text-lg mb-4 mt-8">DEVELOPMENT</h2>
          <p className="mb-3">
            Started at{" "}
            {formatDate(data.startup.developerVotingEndedAt!, {
              time: true,
            })}
          </p>
          <p className="mb-3">
            Deadline:{" "}
            {formatDate(data.startup.developmentDeadline!, {
              time: true,
            })}
          </p>
          {data.startup.status === "development" ? (
            <p className="mb-3">In progress...</p>
          ) : (
            <p className="mb-3">
              Ended at {formatDate(data.startup.developmentEndedAt!)}
            </p>
          )}
          {data.startup.isDevelopmentLate && (
            <p className="text-red-400 mb-3 font-bold">Deadline overdue</p>
          )}
          {isStartupStatusSameOrLaterThan(
            data.startup.status,
            "development_succeded"
          ) && (
            <p className="text-green-600 font-bold mb-3">
              Development succeded
            </p>
          )}
          <p>
            Developer:{" "}
            <Link
              to={`/admin/users/${data.startup.developerId}`}
              className="text-blue-400"
            >
              {data.startup.developer!.shortOrgName} (
              {data.startup.developer!.email})
            </Link>
          </p>
          <h3 className="font-bold text-base mb-4 mt-4">Reports</h3>
          <Table
            data={data.startup.reports}
            columns={[
              { id: "id", header: "Id" },
              {
                id: "result",
                header: "Result",
                cell: ({ row }) =>
                  row.yeas === reportVerificationYeaThreshold ? (
                    <span className="font-bold text-green-600">Success</span>
                  ) : row.nays === startupVerificationNayThreshold ? (
                    <span className="font-bold text-red-400">Fail</span>
                  ) : (
                    "Voting in progress..."
                  ),
                width: 200,
              },
              {
                id: "yeas",
                header: "Yeas",
                cell: ({ row }) => (
                  <span className="font-bold text-green-600">{row.yeas}</span>
                ),
              },
              {
                id: "nays",
                header: "Nays",
                cell: ({ row }) => (
                  <span className="font-bold text-red-400">{row.nays}</span>
                ),
              },
              {
                id: "date",
                header: "Date",
                cell: ({ row }) => formatDate(row.updatedAt, { time: true }),
              },
            ]}
            onRowClick={({ row }) => navigate(`report/${row.id}`)}
          />
        </>
      )}
      {isStartupStatusSameOrLaterThan(
        data.startup.status,
        "developerVoting"
      ) && (
        <>
          <div id="developer-application" className="relative bottom-5" />
          <h2 className="font-bold text-lg mb-4 mt-8">DEVELOPER VOTING</h2>
          <p className="mb-3">
            Started at{" "}
            {formatDate(data.startup.developerApplicationEndedAt!, {
              time: true,
            })}
          </p>
          <p className="mb-3">
            Deadline:{" "}
            {formatDate(data.startup.developerVotingDeadline!, {
              time: true,
            })}
          </p>
          {data.startup.status === "developerVoting" ? (
            <p className="mb-3">In progress...</p>
          ) : (
            <p className="mb-3">
              Ended at {formatDate(data.startup.developerVotingEndedAt!)}
            </p>
          )}
          {isStartupStatusSameOrLaterThan(
            data.startup.status,
            "developerVoting_succeded"
          ) && (
            <p className="text-green-600 font-bold mb-3">
              Developer voting succeded
            </p>
          )}
          <p>
            Leaders ({data.startup.maxApproval}%):{" "}
            {data.startup.maxApprovalApplicationsDeveloper.map(
              (applicationDeveloper) => (
                <Link
                  to={`/admin/users/${applicationDeveloper.developerId}`}
                  key={applicationDeveloper.id}
                  className="text-blue-400 ml-3"
                >
                  {applicationDeveloper.developer.email}
                </Link>
              )
            )}
          </p>
          <h3 className="font-bold text-base mb-4 mt-4">
            Developer application approval
          </h3>
          <Table
            data={data.startup.applicationsDeveloper}
            columns={[
              { id: "id", header: "Id" },
              {
                id: "developer",
                header: "Developer",
                cell: ({ row }) => (
                  <Link
                    to={`/admin/users/${row.developer.id}`}
                    onClick={(e) => e.stopPropagation()}
                    className="text-blue-400"
                  >
                    {row.developer.fullName} ({row.developer.email})
                  </Link>
                ),
                width: 300,
              },
              {
                id: "approval",
                header: "Approval",
                cell: ({ row }) => `${Math.trunc(row.approval * 100)}%`,
              },
            ]}
            onRowClick={({ row }) =>
              navigate(`application-developer/${row.id}`)
            }
          />
        </>
      )}
      {isStartupStatusSameOrLaterThan(
        data.startup.status,
        "developerApplication"
      ) && (
        <>
          <div id="developer-application" className="relative bottom-5" />
          <h2 className="font-bold text-lg mb-4 mt-8">DEVELOPER APPLICATION</h2>
          <p className="mb-3">
            Started at{" "}
            {formatDate(data.startup.financingEndedAt!, { time: true })}
          </p>
          <p className="mb-3">
            Deadline:{" "}
            {formatDate(data.startup.developerApplicationDeadline!, {
              time: true,
            })}
          </p>
          {data.startup.status === "developerApplication" ? (
            <p className="mb-3">In progress...</p>
          ) : (
            <p className="mb-3">
              Ended at {formatDate(data.startup.developerApplicationEndedAt!)}
            </p>
          )}
          {isStartupStatusSameOrLaterThan(
            data.startup.status,
            "developerApplication_succeded"
          ) && (
            <p className="text-green-600 font-bold mb-3">
              Developer application succeded
            </p>
          )}
          <p className="mb-3">
            <span className="font-bold">
              {data.startup.applicationsDeveloperCount}
            </span>{" "}
            total
          </p>
          <h3 className="font-bold text-base mb-4 mt-4">
            Developer applications
          </h3>
          <Table
            data={data.startup.applicationsDeveloper}
            columns={[
              { id: "id", header: "Id" },
              {
                id: "developer",
                header: "Developer",
                cell: ({ row }) => (
                  <Link
                    to={`/admin/users/${row.developer.id}`}
                    onClick={(e) => e.stopPropagation()}
                    className="text-blue-400"
                  >
                    {row.developer.fullName} ({row.developer.email})
                  </Link>
                ),
                width: 300,
              },
              { id: "message", header: "Message", width: 400 },
              {
                id: "date",
                header: "Date",
                cell: ({ row }) => formatDate(row.updatedAt, { time: true }),
              },
            ]}
            onRowClick={({ row }) =>
              navigate(`application-developer/${row.id}`)
            }
          />
        </>
      )}
      {isStartupStatusSameOrLaterThan(data.startup.status, "financing") && (
        <>
          <h2 className="font-bold text-lg mb-4 mt-8">FINANCING</h2>
          <p className="mb-3">
            Started at{" "}
            {formatDate(data.startup.verificationEndedAt!, { time: true })}
          </p>
          <p className="mb-3">
            Deadline:{" "}
            {formatDate(data.startup.financingDeadline!, { time: true })}
          </p>
          {data.startup.status === "financing" ? (
            <p className="mb-3">In progress...</p>
          ) : (
            <p className="mb-3">
              Ended at {formatDate(data.startup.financingEndedAt!)}
            </p>
          )}
          {isStartupStatusSameOrLaterThan(
            data.startup.status,
            "financing_failed"
          ) && <p className="text-red-400 font-bold mb-3">Financing failed</p>}
          {isStartupStatusSameOrLaterThan(
            data.startup.status,
            "financing_succeded"
          ) && (
            <p className="text-green-600 font-bold mb-3">Financing succeded</p>
          )}
          <div className="flex gap-4 items-center">
            <ProgressBar
              progress={
                (data.startup.receivedFinancing /
                  data.startup.targetFinancing) *
                100
              }
              className="w-1/2"
            />
            <p className="text-base">
              Finances:{" "}
              <span className="text-green-600 font-bold">
                {data.startup.receivedFinancing}
              </span>{" "}
              / {data.startup.targetFinancing}
            </p>
          </div>
          <h3 className="font-bold text-base mb-4 mt-4">Investments</h3>
          <Table
            data={data.startup.investments}
            columns={[
              { id: "id", header: "Id" },
              {
                id: "investor",
                header: "Investor",
                cell: ({ row }) => (
                  <Link
                    to={`/admin/users/${row.investor.id}`}
                    className="text-blue-400"
                  >
                    {row.investor.fullName} ({row.investor.email})
                  </Link>
                ),
                width: 300,
              },
              {
                id: "amount",
                header: "Amount",
              },
              {
                id: "date",
                header: "Date",
                cell: ({ row }) => formatDate(row.updatedAt, { time: true }),
              },
            ]}
          />
        </>
      )}
      {isStartupStatusSameOrLaterThan(data.startup.status, "verification") && (
        <>
          <h2 className="font-bold text-lg mb-4 mt-8">VERIFICATION</h2>
          <p className="mb-3">
            Started at {formatDate(data.startup.createdAt, { time: true })}
          </p>
          {data.startup.status === "verification" ? (
            <p className="mb-3">In progress...</p>
          ) : (
            <p className="mb-3">
              Ended at {formatDate(data.startup.verificationEndedAt!)}
            </p>
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
