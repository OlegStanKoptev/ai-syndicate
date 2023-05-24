import { json } from "@remix-run/node";
import type { ActionFunction } from "react-router";
import { z } from "zod";
import { db } from "~/db.server";
import {
  getStartupLeadingApplicationsDeveloper,
  newServerDate,
  requireCurrentApiUser,
} from "~/utils.server";
import invariant from "tiny-invariant";

const requestBodySchema = z.object({
  developmentDeadline: z.preprocess(
    (val) => (typeof val == "string" ? new Date(val) : undefined),
    z.date()
  ),
  applicationDeveloperId: z.string().min(1),
});

export const action: ActionFunction = async ({ request, params }) => {
  const { startupId } = params;
  invariant(typeof startupId === "string");
  const startupData = await db.startup.findUnique({ where: { id: startupId } });
  if (!startupData) {
    return json(
      { message: `Startup with this id not found: ${startupId}` },
      { status: 404 }
    );
  }
  if (startupData.status !== "developerVoting_succeded") {
    return json(
      {
        message:
          "You can only do this for startups that are in 'developerVoting_succeded' status",
      },
      { status: 409 }
    );
  }
  const data = await request.json();
  const dataValidationResult = requestBodySchema.safeParse(data);
  if (!dataValidationResult.success) {
    return json(
      { message: "Validation error", zod: dataValidationResult.error },
      { status: 400 }
    );
  }
  const validatedData = dataValidationResult.data;
  const user = await requireCurrentApiUser(request);
  if (user.id !== startupData.startuperId) {
    return json({ message: "Must be the startup owner" }, { status: 403 });
  }
  const leadingApplications = await getStartupLeadingApplicationsDeveloper(
    startupId
  );
  if (!leadingApplications.ids.includes(validatedData.applicationDeveloperId)) {
    return json(
      { message: "Must be one of leading applications" },
      { status: 409 }
    );
  }
  const applicationDeveloper = await db.applicationDeveloper.findUnique({
    where: { id: validatedData.applicationDeveloperId },
  });
  invariant(applicationDeveloper);
  await db.startup.update({
    where: { id: startupId },
    data: {
      status: "development",
      developmentDeadline: validatedData.developmentDeadline,
      developerId: applicationDeveloper.developerId,
      updatedAt: await newServerDate(),
    },
  });
  return new Response();
};
