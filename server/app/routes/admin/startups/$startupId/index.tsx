import type { Startup } from "@prisma/client";
import type { LoaderFunction, MetaFunction } from "@remix-run/node";
import { Link, useCatch, useLoaderData } from "@remix-run/react";
import invariant from "tiny-invariant";
import { CardField, ExpectedError, UnexpectedError } from "~/components";
import { db } from "~/db.server";
import {
  deserialize,
  formatDate,
  serialize,
  startupStatusNames,
} from "~/utils";
import { requireCurrentAdmin } from "~/utils.server";

type LoaderData = {
  startup: Startup & {
    startuper: {
      id: string;
      fullName: string;
      email: string;
    };
  };
};

export const loader: LoaderFunction = async ({ request, params }) => {
  const { startupId } = params;
  invariant(startupId);
  await requireCurrentAdmin(request);
  const startup = await db.startup.findUnique({
    where: { id: startupId },
    include: {
      startuper: {
        select: { id: true, fullName: true, email: true },
      },
    },
  });
  if (!startup) {
    throw new Response(`Startup with this id: ${startupId} not found`, {
      status: 404,
    });
  }
  return new Response(serialize<LoaderData>({ startup } as any));
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
      <h2 className="font-bold text-lg mt-8 ml-4">INFO</h2>
      <div className="mx-4 mt-4 grid grid-cols-2 gap-16">
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
