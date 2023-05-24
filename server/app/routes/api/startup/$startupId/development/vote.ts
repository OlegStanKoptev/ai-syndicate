import { json } from "@remix-run/node";
import type { ActionFunction } from "react-router";
import { z } from "zod";
import { db } from "~/db.server";
import {
  getReportNaysTotal,
  getReportYeasTotal,
  newServerDate,
  requireCurrentApiUser,
} from "~/utils.server";
import invariant from "tiny-invariant";
import {
  reportVerificationNayThreshold,
  reportVerificationYeaThreshold,
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
  if (startupData.status !== "development") {
    return json(
      {
        message:
          "You can only vote for startups that are in 'development' status",
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
  if (!startupData.currentReportId) {
    return json(
      { message: "There is no current report for voting" },
      { status: 404 }
    );
  }
  const currentReport = await db.report.findUnique({
    where: { id: startupData.currentReportId },
  });
  invariant(currentReport);
  const existingVote = await db.voteReport.findUnique({
    where: {
      reportId_expertId: {
        reportId: startupData.currentReportId,
        expertId: user.id,
      },
    },
  });
  if (existingVote) {
    await db.voteReport.update({
      where: { id: existingVote.id },
      data: {
        yea: validatedData.yea,
        nayReason: validatedData.nayReason ?? null,
        updatedAt: await newServerDate(),
      },
    });
  } else {
    await db.voteReport.create({
      data: {
        reportId: startupData.currentReportId,
        expertId: user.id,
        yea: validatedData.yea,
        nayReason: validatedData.nayReason,
        createdAt: await newServerDate(),
        updatedAt: await newServerDate(),
      },
    });
  }
  const yeasTotal = await getReportYeasTotal(startupData.currentReportId);
  const naysTotal = await getReportNaysTotal(startupData.currentReportId);
  if (yeasTotal >= reportVerificationYeaThreshold) {
    await db.startup.update({
      where: { id: startupId },
      data: {
        status: "development_succeded",
        developmentEndedAt: await newServerDate(),
        updatedAt: await newServerDate(),
      },
    });
  }
  if (naysTotal >= reportVerificationNayThreshold) {
    await db.startup.update({
      where: { id: startupId },
      data: {
        currentReportId: null,
        updatedAt: await newServerDate(),
      },
    });
  }
  return new Response();
};
