import { json } from "@remix-run/node";
import type { ActionFunction } from "react-router";
import { z } from "zod";
import { db } from "~/db.server";
import { requireCurrentUserForApi } from "~/utils.server";

const requestBodySchema = z.object({
  name: z.string().min(1),
  description: z.string().min(1),
  logoFile: z.string().optional().nullable(),
  specificationFile: z.string().min(1),
  businessPlanFile: z.string().optional().nullable(),
  presentationFile: z.string().optional().nullable(),
});

type ActionData = { id: string };

export const action: ActionFunction = async ({ request }) => {
  const data = await request.json();
  const dataValidationResult = requestBodySchema.safeParse(data);
  if (!dataValidationResult.success) {
    return json(
      { message: "Validation error", zod: dataValidationResult.error },
      { status: 400 }
    );
  }
  const validatedData = dataValidationResult.data;
  const user = await requireCurrentUserForApi(request);
  if (user.role !== "user") {
    return json(
      { message: "Must be a 'user' to create a new startup" },
      { status: 403 }
    );
  }
  const startup = await db.startup.create({
    data: {
      status: "verification",
      startuperId: user.id,
      name: validatedData.name,
      description: validatedData.description,
      logoFile: validatedData.logoFile,
      specificationFile: validatedData.specificationFile,
      businessPlanFile: validatedData.businessPlanFile,
      presentationFile: validatedData.presentationFile,
    },
  });
  return json<ActionData>({ id: startup.id });
};
