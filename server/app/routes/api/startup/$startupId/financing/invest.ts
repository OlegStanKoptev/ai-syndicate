import { json } from "@remix-run/node";
import type { ActionFunction } from "react-router";
import { z } from "zod";
import { db } from "~/db.server";
import {
  getStartupTotalFinancing,
  requireCurrentApiUser,
} from "~/utils.server";
import invariant from "tiny-invariant";

const requestBodySchema = z.object({
  amount: z.preprocess(
    (val) => (val ? Number(val) : undefined),
    z.number().int().positive()
  ),
});

export const action: ActionFunction = async ({ request, params }) => {
  const { startupId } = params;
  invariant(typeof startupId === "string");
  const startup = await db.startup.findUnique({ where: { id: startupId } });
  if (!startup) {
    return json(
      { message: `Startup with this id not found: ${startupId}` },
      { status: 404 }
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
  if (user.role !== "user") {
    return json({ message: "You must be a 'user' to invest" }, { status: 403 });
  }
  invariant(typeof user.balance === "number");
  if (startup.status !== "financing") {
    return json(
      {
        message:
          "You can only invest in startups that are in 'financing' state",
      },
      { status: 409 }
    );
  }
  if (user.balance < validatedData.amount) {
    return json(
      {
        message: "Not enough coins on balance",
      },
      { status: 409 }
    );
  }
  const startupTotalFinancingBefore = await getStartupTotalFinancing(startupId);
  if (
    startupTotalFinancingBefore + validatedData.amount >
    startup.targetFinancing
  ) {
    return json(
      {
        message: "This is too much financing",
      },
      { status: 409 }
    );
  }
  await db.investment.create({
    data: {
      amount: validatedData.amount,
      investorId: user.id,
      startupId: startup.id,
    },
  });
  await db.user.update({
    where: { id: user.id },
    data: { balance: user.balance - validatedData.amount },
  });
  const startupTotalFinancingNow = await getStartupTotalFinancing(startupId);
  if (startupTotalFinancingNow === startup.targetFinancing) {
    await db.startup.update({
      where: { id: startup.id },
      data: { status: "financing_succeded", financingEndedAt: new Date() },
    });
  }
  return new Response();
};
