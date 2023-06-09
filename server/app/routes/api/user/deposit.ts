import { json } from "@remix-run/node";
import type { ActionFunction } from "react-router";
import { z } from "zod";
import { db } from "~/db.server";
import { newServerDate, requireCurrentApiUser } from "~/utils.server";
import invariant from "tiny-invariant";

const requestBodySchema = z.object({
  amount: z.number().int().positive(),
});

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
  const user = await requireCurrentApiUser(request);
  if (user.role !== "user") {
    return json(
      { message: "You must be a 'user' to make a deposit" },
      { status: 403 }
    );
  }
  invariant(typeof user.balance === "number");
  const investor = await db.user.update({
    where: { id: user.id },
    data: {
      balance: user.balance + validatedData.amount,
      updatedAt: await newServerDate(),
    },
  });
  await db.deposit.create({
    data: {
      amount: validatedData.amount,
      investorId: investor.id,
      createdAt: await newServerDate(),
      updatedAt: await newServerDate(),
    },
  });
  invariant(typeof investor.balance === "number");
  return json({ balance: investor.balance });
};
