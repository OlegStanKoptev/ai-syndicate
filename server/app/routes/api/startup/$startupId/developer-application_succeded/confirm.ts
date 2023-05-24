import { json } from "@remix-run/node";
import type { ActionFunction } from "react-router";
import { z } from "zod";
import { db } from "~/db.server";
import {
  newServerDate,
  requireCurrentApiUser,
  scheduleStartupDeveloperVotingDeadline,
} from "~/utils.server";
import invariant from "tiny-invariant";

const requestBodySchema = z.object({
  developerVotingDeadline: z.preprocess(
    (val) => (typeof val == "string" ? new Date(val) : undefined),
    z.date()
  ),
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
  if (startupData.status !== "developerApplication_succeded") {
    return json(
      {
        message:
          "You can only do this for startups that are in 'developerApplication_succeded' status",
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
  await db.startup.update({
    where: { id: startupId },
    data: {
      status: "developerVoting",
      developerVotingDeadline: validatedData.developerVotingDeadline,
      updatedAt: await newServerDate(),
    },
  });
  scheduleStartupDeveloperVotingDeadline(
    startupId,
    validatedData.developerVotingDeadline
  );
  return new Response();
};
