import { json } from "@remix-run/node";
import type { ActionFunction } from "react-router";
import { z } from "zod";
import { db } from "~/db.server";
import bycript from "bcryptjs";
import { newServerDate } from "~/utils.server";

const requestBodySchema = z.object({
  email: z.string().email(),
  password: z.string().min(1),
  phone: z.string().optional().nullable(),
  avatarImageFile: z.string().optional().nullable(),
  orgName: z.string().min(1),
  shortOrgName: z.string().min(1),
  inn: z
    .string()
    .min(1)
    .length(10)
    .refine((val) => val.split("").every((s) => !isNaN(parseInt(s)))),
  ogrn: z
    .string()
    .min(1)
    .length(13)
    .refine((val) => val.split("").every((s) => !isNaN(parseInt(s)))),
  kpp: z
    .string()
    .min(1)
    .length(9)
    .refine((val) => val.split("").every((s) => !isNaN(parseInt(s)))),
  legalAddress: z.string().min(1),
  actualAddress: z.string().min(1),
  website: z.string().min(1),
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
  const application = await db.applicationNewDeveloper.create({
    data: {
      status: "new",
      email: validatedData.email,
      passwordHash: await bycript.hash(validatedData.password, 10),
      phone: validatedData.phone,
      avatarImageFile: validatedData.avatarImageFile,
      orgName: validatedData.orgName,
      shortOrgName: validatedData.shortOrgName,
      inn: validatedData.inn,
      ogrn: validatedData.ogrn,
      kpp: validatedData.kpp,
      legalAddress: validatedData.legalAddress,
      actualAddress: validatedData.actualAddress,
      website: validatedData.website,
      createdAt: await newServerDate(),
      updatedAt: await newServerDate(),
    },
  });
  return json({ id: application.id });
};
