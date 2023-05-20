import type { ApplicationNewDeveloper } from "@prisma/client";
import type {
  ActionFunction,
  LoaderFunction,
  MetaFunction,
} from "@remix-run/node";
import { Form, Link, useLoaderData } from "@remix-run/react";
import invariant from "tiny-invariant";
import { Button, TextInput } from "~/components";
import { db } from "~/db.server";
import { deserialize, serialize } from "~/utils";
import { requireCurrentAdmin } from "~/utils.server";

export const action: ActionFunction = async ({ request }) => {
  await requireCurrentAdmin(request);
  const data = Object.fromEntries(await request.formData());
  const { __action, applicationId } = data;
  invariant(typeof applicationId === "string");
  const application = await db.applicationNewDeveloper.findUnique({
    where: { id: applicationId },
  });
  if (!application) {
    return new Response("Application not found", { status: 404 });
  }
  if (__action === "approve") {
    const developer = await db.user.findUnique({
      where: { email: application.email },
    });
    if (developer) {
      return new Response("Developer with this email already exists", {
        status: 409,
      });
    }
    await db.applicationNewDeveloper.update({
      where: { id: applicationId },
      data: { status: "approved" },
    });
    await db.user.create({
      data: {
        role: "developer",
        email: application.email,
        passwordHash: application.passwordHash,
        phone: application.phone,
        avatarImageFile: application.avatarImageFile,
        orgName: application.orgName,
        shortOrgName: application.shortOrgName,
        inn: application.inn,
        ogrn: application.ogrn,
        kpp: application.kpp,
        legalAddress: application.legalAddress,
        actualAddress: application.actualAddress,
        website: application.website,
      },
    });
    return new Response();
  }
  if (__action === "decline") {
    const { declineReason } = data;
    invariant(typeof declineReason === "string" && declineReason.length > 0);
    await db.applicationNewDeveloper.update({
      where: { id: applicationId },
      data: { status: "declined", declineReason },
    });
    return new Response();
  }
  throw new Error(`Invalid action: ${__action}`);
};

export const meta: MetaFunction = () => {
  return {
    title: "AI Syndicate (admin) | New developer applications",
  };
};

export const handle = {
  breadcrumb: () => (
    <Link to="/admin/new-developer-applications">
      New developer applications
    </Link>
  ),
};

type LoaderData = {
  applications: ApplicationNewDeveloper[];
  applicationsApproved: ApplicationNewDeveloper[];
  applicationsDeclined: ApplicationNewDeveloper[];
};

export const loader: LoaderFunction = async ({ request }) => {
  await requireCurrentAdmin(request);
  const applications = await db.applicationNewDeveloper.findMany({
    where: { status: "new" },
  });
  const applicationsApproved = await db.applicationNewDeveloper.findMany({
    where: { status: "approved" },
  });
  const applicationsDeclined = await db.applicationNewDeveloper.findMany({
    where: { status: "declined" },
  });

  return serialize<LoaderData>({
    applications,
    applicationsApproved,
    applicationsDeclined,
  });
};

export default function NewDeveloperApplications() {
  const data = deserialize<LoaderData>(useLoaderData());
  return (
    <div className="m-4">
      <h1 className="font-bold mb-3">New</h1>
      {data.applications.length === 0 ? (
        "No applications"
      ) : (
        <ul>
          {data.applications.map((application) => (
            <li
              key={application.id}
              className="border p-3 flex gap-10 items-center"
            >
              {" "}
              <div>{application.id}</div>
              {application.shortOrgName}
              <Form method="post">
                <Button size="sm" type="submit" name="__action" value="approve">
                  Approve
                </Button>
                <input
                  type="hidden"
                  name="applicationId"
                  value={application.id}
                />
              </Form>
              <Form method="post" className="flex gap-3 items-center">
                <Button size="sm" type="submit" name="__action" value="decline">
                  Decline
                </Button>
                <TextInput placeholder="Nay reason" name="declineReason" />
                <input
                  type="hidden"
                  name="applicationId"
                  value={application.id}
                />
              </Form>
            </li>
          ))}
        </ul>
      )}
      <h1 className="font-bold mb-3 mt-5">Approved</h1>
      {data.applicationsApproved.length === 0 ? (
        "No approved applications"
      ) : (
        <ul>
          {data.applicationsApproved.map((application) => (
            <li
              key={application.id}
              className="border p-3 flex gap-10 items-center"
            >
              <div>{application.id}</div>
              {application.shortOrgName}
            </li>
          ))}
        </ul>
      )}
      <h1 className="font-bold mb-3 mt-5">Declined</h1>
      {data.applicationsDeclined.length === 0 ? (
        "No declined applications"
      ) : (
        <ul>
          {data.applicationsDeclined.map((application) => (
            <li
              key={application.id}
              className="border p-3 flex gap-10 items-center"
            >
              {" "}
              <div>{application.id}</div>
              {application.shortOrgName}
              <div>Decline reason: {application.declineReason}</div>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
