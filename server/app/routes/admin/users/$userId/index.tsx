import type { User } from "@prisma/client";
import type { LoaderFunction, MetaFunction } from "@remix-run/node";
import { Link, useCatch, useLoaderData } from "@remix-run/react";
import invariant from "tiny-invariant";
import { CardField, ExpectedError, UnexpectedError } from "~/components";
import { db } from "~/db.server";
import { deserialize, serialize, formatUrl, userRoleNames } from "~/utils";
import { requireCurrentAdmin } from "~/utils.server";

type LoaderData = {
  user: User;
};

export const loader: LoaderFunction = async ({ request, params }) => {
  const { userId } = params;
  invariant(userId);
  await requireCurrentAdmin(request);
  const user = await db.user.findUnique({
    where: { id: userId },
  });
  if (!user) {
    throw new Response(`User with this id: ${userId} not found`, {
      status: 404,
    });
  }
  return new Response(serialize<LoaderData>({ user }));
};

export const meta: MetaFunction = (args) => {
  const data = deserialize<LoaderData>(args.data as string | undefined);
  return {
    title: `AI Syndicate (admin) | User ${data ? data.user.email : "?"}`,
  };
};

export default function UserIndex() {
  const data = deserialize<LoaderData>(useLoaderData());
  return (
    <div className="m-4">
      <div className="flex items-center gap-4">
        <h1 className="text-xl">
          {userRoleNames[data.user.role]}{" "}
          <span className="font-bold">{data.user.email}</span>{" "}
        </h1>
      </div>
      {data.user.role === "admin" ? (
        <div className="mx-4 my-8 grid grid-cols-2 gap-16">
          <div>
            <CardField name="Full name">{data.user.fullName}</CardField>
            <CardField name="Email">{data.user.email}</CardField>
          </div>
        </div>
      ) : data.user.role === "user" ? (
        <div className="mx-4 my-8 grid grid-cols-2 gap-16">
          <div>
            <CardField name="Full name">{data.user.fullName}</CardField>
            <CardField name="Email">{data.user.email}</CardField>
            <CardField name="Avatar image file">
              {data.user.avatarImageFile ? (
                <a
                  href={`/files/${data.user.avatarImageFile}`}
                  target="_blank"
                  rel="noreferrer"
                  className="text-blue-400"
                >
                  {data.user.avatarImageFile}
                </a>
              ) : null}
            </CardField>
          </div>
        </div>
      ) : data.user.role === "expert" ? (
        <div className="mx-4 my-8 grid grid-cols-2 gap-16">
          <div>
            <CardField name="Full name">{data.user.fullName}</CardField>
            <CardField name="Email">{data.user.email}</CardField>
          </div>
        </div>
      ) : data.user.role === "developer" ? (
        <div className="mx-4 my-8 grid grid-cols-2 gap-16">
          <div>
            <CardField name="Org name">{data.user.orgName}</CardField>
            <CardField name="Short org name">
              {data.user.shortOrgName}
            </CardField>
            <CardField name="Email">{data.user.email}</CardField>
            <CardField name="Avatar image file">
              {data.user.avatarImageFile ? (
                <a
                  href={`/files/${data.user.avatarImageFile}`}
                  target="_blank"
                  rel="noreferrer"
                  className="text-blue-400"
                >
                  {data.user.avatarImageFile}
                </a>
              ) : null}
            </CardField>
            <CardField name="Org name">{data.user.orgName}</CardField>
            <CardField name="Short org name">
              {data.user.shortOrgName}
            </CardField>
            <CardField name="INN">{data.user.inn}</CardField>
            <CardField name="OGRN">{data.user.ogrn}</CardField>
            <CardField name="KPP">{data.user.kpp}</CardField>
            <CardField name="Legal address">{data.user.legalAddress}</CardField>
            <CardField name="Actual address">
              {data.user.actualAddress}
            </CardField>
            <CardField name="Website">
              <a
                href={formatUrl(data.user.website!)}
                target="_blank"
                rel="noreferrer"
                className="text-blue-400"
              >
                {data.user.website}
              </a>
            </CardField>
          </div>
        </div>
      ) : null}
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