import type { ActionFunction } from "@remix-run/node";
import { json } from "react-router";
import { z } from "zod";
import { db } from "~/db.server";
import bcrypt from "bcryptjs";
import { loginForApi } from "~/utils.server";

const requestBodySchema = z.object({
  email: z.string().email(),
  password: z.string(),
  rememberMe: z.boolean().optional(),
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
  const user = await db.user.findUnique({
    where: { email: validatedData.email },
  });
  if (!user) {
    return json(
      {
        message: `User with this email not found: ${validatedData.email}`,
      },
      { status: 401 }
    );
  }
  const isPasswordCorrect = await bcrypt.compare(
    validatedData.password,
    user.passwordHash
  );
  if (!isPasswordCorrect) {
    return json({ message: "Wrong password" }, { status: 401 });
  }
  return loginForApi(request, user.id, validatedData.rememberMe);
};
