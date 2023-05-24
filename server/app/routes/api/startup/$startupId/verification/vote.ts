import { json } from "@remix-run/node";
import type { ActionFunction } from "react-router";
import { z } from "zod";
import { db } from "~/db.server";
import {
  emailFrom,
  emailTransporter,
  getNewStartupNaysTotal,
  getNewStartupYeasTotal,
  newServerDate,
  requireCurrentApiUser,
} from "~/utils.server";
import invariant from "tiny-invariant";
import {
  startupVerificationNayThreshold,
  startupVerificationYeaThreshold,
} from "~/utils";

const requestBodySchema = z.object({
  yea: z.boolean(),
  nayReason: z.string().optional().nullable(),
});

export const action: ActionFunction = async ({ request, params }) => {
  const { startupId } = params;
  invariant(typeof startupId === "string");
  const startupData = await db.startup.findUnique({
    where: { id: startupId },
    include: { startuper: true },
  });
  if (!startupData) {
    return json(
      { message: `Startup with this id not found: ${startupId}` },
      { status: 404 }
    );
  }
  if (startupData.status !== "verification") {
    return json(
      {
        message:
          "You can only vote for startups that are in 'verification' status",
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
  if (user.role !== "expert") {
    return json(
      { message: "Must be an 'expert' to vote for a startup" },
      { status: 403 }
    );
  }
  if (!validatedData.yea && !validatedData.nayReason) {
    return json({ message: "Must provide 'nayReason'" }, { status: 400 });
  }
  const existingVote = await db.voteNewStartup.findUnique({
    where: { startupId_expertId: { expertId: user.id, startupId } },
  });
  if (existingVote) {
    await db.voteNewStartup.update({
      where: { id: existingVote.id },
      data: {
        yea: validatedData.yea,
        nayReason: validatedData.nayReason ?? null,
        updatedAt: await newServerDate(),
      },
    });
  } else {
    await db.voteNewStartup.create({
      data: {
        startupId,
        expertId: user.id,
        yea: validatedData.yea,
        nayReason: validatedData.nayReason,
        createdAt: await newServerDate(),
        updatedAt: await newServerDate(),
      },
    });
  }
  const yeasTotal = await getNewStartupYeasTotal(startupId);
  const naysTotal = await getNewStartupNaysTotal(startupId);
  if (yeasTotal >= startupVerificationYeaThreshold) {
    await db.startup.update({
      where: { id: startupId },
      data: {
        status: "verification_succeded",
        verificationEndedAt: await newServerDate(),
        updatedAt: await newServerDate(),
      },
    });
  }
  if (naysTotal >= startupVerificationNayThreshold) {
    const nayVotes = await db.voteNewStartup.findMany({
      where: { startupId, yea: false },
      include: { expert: true },
    });
    await db.startup.update({
      where: { id: startupId },
      data: {
        status: "verification_failed",
        verificationEndedAt: await newServerDate(),
        updatedAt: await newServerDate(),
      },
    });
    emailTransporter.sendMail({
      from: emailFrom,
      to: startupData.startuper.email,
      subject: "Your startup was rejected",
      html: nayVotes
        .map(
          (nayVote) => `<p>${nayVote.expert.fullName}: ${nayVote.nayReason}</p>`
        )
        .join("\n"),
    });
  }
  return new Response();
};
