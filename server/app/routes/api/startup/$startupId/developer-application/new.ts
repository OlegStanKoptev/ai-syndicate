import { json } from "@remix-run/node";
import type { ActionFunction } from "react-router";
import { z } from "zod";
import { db } from "~/db.server";
import { newServerDate, requireCurrentApiUser } from "~/utils.server";
import invariant from "tiny-invariant";

const requestBodySchema = z.object({
  message: z.string().min(1),
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
  if (startupData.status !== "developerApplication") {
    return json(
      {
        message:
          "You do this for startups that are in 'developerApplication' status",
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
  if (user.role !== "developer") {
    return json(
      { message: "Must be an 'developer' to do this" },
      { status: 403 }
    );
  }
  await db.applicationDeveloper.create({
    data: {
      startupId,
      developerId: user.id,
      status: "new",
      message: validatedData.message,
      createdAt: await newServerDate(),
      updatedAt: await newServerDate(),
    },
  });
  return new Response();
};
