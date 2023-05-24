import { json } from "@remix-run/node";
import type { ActionFunction } from "react-router";
import { z } from "zod";
import { db } from "~/db.server";
import { newServerDate, requireCurrentApiUser } from "~/utils.server";
import invariant from "tiny-invariant";

const requestBodySchema = z.object({
  applicationDeveloperId: z.string().min(1),
});

export const action: ActionFunction = async ({ request, params }) => {
  const { startupId } = params;
  invariant(typeof startupId === "string");
  const startupData = await db.startup.findUnique({
    where: { id: startupId },
    include: { investments: true },
  });
  if (!startupData) {
    return json(
      { message: `Startup with this id not found: ${startupId}` },
      { status: 404 }
    );
  }
  if (startupData.status !== "developerVoting") {
    return json(
      {
        message:
          "You can only vote for startups that are in 'developerVoting' status",
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
  const applicationDeveloper = await db.applicationDeveloper.findUnique({
    where: { id: validatedData.applicationDeveloperId },
  });
  if (!applicationDeveloper) {
    return json(
      {
        message: `Developer application with this id not found: ${validatedData.applicationDeveloperId}`,
      },
      { status: 404 }
    );
  }
  const user = await requireCurrentApiUser(request);
  if (
    startupData.startuperId !== user.id &&
    !(await db.investment.findFirst({
      where: { investorId: user.id, startupId },
    }))
  ) {
    return json(
      { message: "Must be an the owner or an investor of this startup" },
      { status: 403 }
    );
  }
  const existingVote = await db.voteDeveloperApplication.findUnique({
    where: {
      applicationDeveloperId_voterId: {
        applicationDeveloperId: applicationDeveloper.id,
        voterId: user.id,
      },
    },
  });
  if (!existingVote) {
    await db.voteDeveloperApplication.create({
      data: {
        applicationDeveloperId: applicationDeveloper.id,
        voterId: user.id,
        createdAt: await newServerDate(),
        updatedAt: await newServerDate(),
      },
    });
  }
  return new Response();
};
