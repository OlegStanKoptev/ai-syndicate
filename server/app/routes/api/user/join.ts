import { json } from "@remix-run/node";
import type { ActionFunction } from "react-router";
import { z } from "zod";
import { db } from "~/db.server";
import bycript from "bcryptjs";
import type { User } from "~/utils";
import { parseUser } from "~/utils";

const requestBodySchema = z.object({
  email: z.string().email(),
  password: z.string().min(8).max(32),
  fullName: z.string().min(1),
  phone: z.string().optional().nullable(),
  avatarImageFile: z.string().optional().nullable(),
});

type ActionData = User;

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
  const existingUser = await db.user.findUnique({
    where: { email: validatedData.email },
  });
  if (existingUser) {
    return json(
      {
        message: `User with this email is registered already: ${validatedData.email}`,
      },
      { status: 401 }
    );
  }
  const user = parseUser(
    await db.user.create({
      data: {
        role: "user",
        email: validatedData.email,
        passwordHash: await bycript.hash(validatedData.password, 10),
        fullName: validatedData.fullName,
        phone: validatedData.phone,
        avatarImageFile: validatedData.avatarImageFile,
        balance: 0,
      },
    })
  );
  return json<ActionData>(user);
};
