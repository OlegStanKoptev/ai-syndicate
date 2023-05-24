import { json } from "@remix-run/node";
import type { ActionFunction } from "react-router";
import { z } from "zod";
import { db } from "~/db.server";
import { newServerDate, requireCurrentApiUser } from "~/utils.server";
import invariant from "tiny-invariant";

const requestBodySchema = z.object({
  reportFile: z.string().min(1),
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
  if (startupData.status !== "development") {
    return json(
      {
        message:
          "You can only do this for startups that are in 'development' status",
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
  if (user.id !== startupData.developerId) {
    return json({ message: "Must be the startup developer" }, { status: 403 });
  }
  if (startupData.currentReportId) {
    return json(
      {
        message: "Cannot file reports because there is one that is not closed",
      },
      { status: 403 }
    );
  }
  const report = await db.report.create({
    data: {
      startupId,
      reportFile: validatedData.reportFile,
      createdAt: await newServerDate(),
      updatedAt: await newServerDate(),
    },
  });
  await db.startup.update({
    where: { id: startupId },
    data: { currentReportId: report.id, updatedAt: await newServerDate() },
  });
  return new Response();
};
