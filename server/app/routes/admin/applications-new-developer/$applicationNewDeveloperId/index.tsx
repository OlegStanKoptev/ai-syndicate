import type { ApplicationNewDeveloper, User } from "@prisma/client";
import type {
  ActionFunction,
  LoaderFunction,
  MetaFunction,
} from "@remix-run/node";
import { Form, Link, useCatch, useLoaderData } from "@remix-run/react";
import invariant from "tiny-invariant";
import {
  Button,
  CardField,
  ExpectedError,
  LinkButton,
  UnexpectedError,
} from "~/components";
import { db } from "~/db.server";
import {
  deserialize,
  serialize,
  formatUrl,
  applicationNewDeveloperStatusNames,
  formatDate,
} from "~/utils";
import { requireCurrentAdmin } from "~/utils.server";

export const action: ActionFunction = async ({ request, params }) => {
  const { applicationNewDeveloperId } = params;
  invariant(applicationNewDeveloperId);
  const admin = await requireCurrentAdmin(request);
  const data = Object.fromEntries(await request.formData());
  const { _action } = data;
  if (_action === "approve") {
    const applicationNewDeveloper = await db.applicationNewDeveloper.findUnique(
      {
        where: { id: applicationNewDeveloperId },
      }
    );
    if (!applicationNewDeveloper) {
      throw new Response(
        `New developer application with id ${applicationNewDeveloperId} not found`,
        {
          status: 404,
        }
      );
    }
    if (applicationNewDeveloper.status !== "new") {
      throw new Response(
        "Only new developer applications in 'new' status can be approved",
        { status: 409 }
      );
    }
    const developer = await db.user.findUnique({
      where: { email: applicationNewDeveloper.email },
    });
    if (developer) {
      throw new Response("Developer with this email already exists", {
        status: 409,
      });
    }
    await db.applicationNewDeveloper.update({
      where: { id: applicationNewDeveloper.id },
      data: {
        status: "approved",
        approvedOrDeclinedById: admin.id,
        approvedOrDeclinedAt: new Date(),
      },
    });
    const newDeveloper = await db.user.create({
      data: {
        role: "developer",
        email: applicationNewDeveloper.email,
        passwordHash: applicationNewDeveloper.passwordHash,
        phone: applicationNewDeveloper.phone,
        avatarImageFile: applicationNewDeveloper.avatarImageFile,
        orgName: applicationNewDeveloper.orgName,
        shortOrgName: applicationNewDeveloper.shortOrgName,
        inn: applicationNewDeveloper.inn,
        ogrn: applicationNewDeveloper.ogrn,
        kpp: applicationNewDeveloper.kpp,
        legalAddress: applicationNewDeveloper.legalAddress,
        actualAddress: applicationNewDeveloper.actualAddress,
        website: applicationNewDeveloper.website,
      },
    });
    await db.applicationNewDeveloper.update({
      where: { id: applicationNewDeveloper.id },
      data: {
        createdDeveloperId: newDeveloper.id,
      },
    });
    return new Response();
  }
  throw new Response(`Invalid _action: ${_action}`, { status: 400 });
};

type LoaderData = {
  applicationNewDeveloper: ApplicationNewDeveloper & {
    approvedOrDeclinedBy: User | null;
    createdDeveloper: User | null;
  };
};

export const loader: LoaderFunction = async ({ request, params }) => {
  const { applicationNewDeveloperId } = params;
  invariant(applicationNewDeveloperId);
  await requireCurrentAdmin(request);
  const applicationNewDeveloper = await db.applicationNewDeveloper.findUnique({
    where: { id: applicationNewDeveloperId },
    include: { approvedOrDeclinedBy: true, createdDeveloper: true },
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

export const meta: MetaFunction = (args) => {
  const data = deserialize<LoaderData>(args.data as string | undefined);
  return {
    title: `AI Syndicate (admin) | New developer application ${
      data ? data.applicationNewDeveloper.shortOrgName : "?"
    }`,
  };
};

export default function ApplicationNewDeveloperIndex() {
  const data = deserialize<LoaderData>(useLoaderData());
  return (
    <div className="m-4">
      <div className="flex items-center gap-4">
        <h1 className="text-xl">
          New developer application{" "}
          <span className="font-bold">
            {data.applicationNewDeveloper.email}
          </span>{" "}
          (
          {
            applicationNewDeveloperStatusNames[
              data.applicationNewDeveloper.status
            ]
          }
          )
        </h1>
      </div>
      {data.applicationNewDeveloper.status === "new" && (
        <>
          <p className="text-base mt-4">
            You can either approve or decline (and specify reason) the
            application
          </p>
          <div className="flex items-center gap-4 mt-2">
            <Form method="post" replace>
              <Button size="sm" type="submit" name="_action" value="approve">
                Approve
              </Button>
            </Form>
            <LinkButton to="decline" size="sm">
              Decline
            </LinkButton>
          </div>
        </>
      )}
      {data.applicationNewDeveloper.status === "declined" && (
        <>
          <p className="text-base mt-4">
            <span className="italic">Reason of decline</span>:{" "}
            {data.applicationNewDeveloper.declineReason}
          </p>
          <p>
            Declined by{" "}
            <Link
              to={`/admin/users/${
                data.applicationNewDeveloper.approvedOrDeclinedBy!.id
              }`}
              className="text-blue-400"
            >
              {data.applicationNewDeveloper.approvedOrDeclinedBy!.fullName} (
              {data.applicationNewDeveloper.approvedOrDeclinedBy!.email})
            </Link>{" "}
            at{" "}
            {formatDate(data.applicationNewDeveloper.approvedOrDeclinedAt!, {
              time: true,
            })}
          </p>
        </>
      )}
      {data.applicationNewDeveloper.status === "approved" && (
        <>
          <p className="text-base mt-4">
            <span className="italic">Developer created</span>:{" "}
            <Link
              to={`/admin/users/${
                data.applicationNewDeveloper.createdDeveloper!.id
              }`}
              className="text-blue-400"
            >
              {data.applicationNewDeveloper.createdDeveloper!.shortOrgName} (
              {data.applicationNewDeveloper.createdDeveloper!.email})
            </Link>
          </p>
          <p>
            Approved by{" "}
            <Link
              to={`/admin/users/${
                data.applicationNewDeveloper.approvedOrDeclinedBy!.id
              }`}
              className="text-blue-400"
            >
              {data.applicationNewDeveloper.approvedOrDeclinedBy!.fullName} (
              {data.applicationNewDeveloper.approvedOrDeclinedBy!.email})
            </Link>{" "}
            at{" "}
            {formatDate(data.applicationNewDeveloper.approvedOrDeclinedAt!, {
              time: true,
            })}
          </p>
        </>
      )}
      <div className="mx-4 my-8 grid grid-cols-2 gap-16">
        <div>
          <CardField name="Status">
            {
              applicationNewDeveloperStatusNames[
                data.applicationNewDeveloper.status
              ]
            }
          </CardField>
          <CardField name="Org name">
            {data.applicationNewDeveloper.orgName}
          </CardField>
          <CardField name="Short org name">
            {data.applicationNewDeveloper.shortOrgName}
          </CardField>
          <CardField name="Email">
            {data.applicationNewDeveloper.email}
          </CardField>
          <CardField name="Avatar image file">
            {data.applicationNewDeveloper.avatarImageFile ? (
              <a
                href={`/files/${data.applicationNewDeveloper.avatarImageFile}`}
                target="_blank"
                rel="noreferrer"
                className="text-blue-400"
              >
                {data.applicationNewDeveloper.avatarImageFile}
              </a>
            ) : null}
          </CardField>
          <CardField name="Org name">
            {data.applicationNewDeveloper.orgName}
          </CardField>
          <CardField name="Short org name">
            {data.applicationNewDeveloper.shortOrgName}
          </CardField>
          <CardField name="INN">{data.applicationNewDeveloper.inn}</CardField>
          <CardField name="OGRN">{data.applicationNewDeveloper.ogrn}</CardField>
          <CardField name="KPP">{data.applicationNewDeveloper.kpp}</CardField>
          <CardField name="Legal address">
            {data.applicationNewDeveloper.legalAddress}
          </CardField>
          <CardField name="Actual address">
            {data.applicationNewDeveloper.actualAddress}
          </CardField>
          <CardField name="Website">
            <a
              href={formatUrl(data.applicationNewDeveloper.website!)}
              target="_blank"
              rel="noreferrer"
              className="text-blue-400"
            >
              {data.applicationNewDeveloper.website}
            </a>
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
