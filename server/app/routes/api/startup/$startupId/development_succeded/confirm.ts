import { json } from "@remix-run/node";
import type { ActionFunction } from "react-router";
import { db } from "~/db.server";
import {
  getStartupTotalFinancing,
  newServerDate,
  requireCurrentApiUser,
} from "~/utils.server";
import invariant from "tiny-invariant";

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
  if (startupData.status !== "development_succeded") {
    return json(
      {
        message:
          "You can only do this for startups that are in 'development_succeded' status",
      },
      { status: 409 }
    );
  }
  const user = await requireCurrentApiUser(request);
  if (user.id !== startupData.startuperId) {
    return json({ message: "Must be the startup owner" }, { status: 403 });
  }
  await db.startup.update({
    where: { id: startupId },
    data: {
      status: "finished",
      finishedAt: await newServerDate(),
      updatedAt: await newServerDate(),
    },
  });
  const amount = await getStartupTotalFinancing(startupId);
  await db.income.create({
    data: {
      amount,
      developerId: startupData.developerId!,
      createdAt: await newServerDate(),
      updatedAt: await newServerDate(),
    },
  });
  await db.user.update({
    where: { id: startupData.developerId! },
    data: { balance: { increment: amount } },
  });
  return new Response();
};
