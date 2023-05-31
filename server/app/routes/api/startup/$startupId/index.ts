import type { LoaderFunction } from "@remix-run/server-runtime";
import { json } from "@remix-run/server-runtime";
import invariant from "tiny-invariant";
import { db } from "~/db.server";
import { isStartupStatusSameOrLaterThan } from "~/utils";
import {
  getApplicationDeveloperApproval,
  getCurrentApiUser,
  getNewStartupNaysTotal,
  getNewStartupYeasTotal,
  getStartupLeadingApplicationsDeveloper,
  getStartupTotalFinancing,
} from "~/utils.server";

export const loader: LoaderFunction = async ({ request, params }) => {
  const { startupId } = params;
  invariant(typeof startupId === "string");
  const startup = await db.startup.findUnique({
    where: { id: startupId },
    include: {
      reports: { orderBy: { updatedAt: "desc" } },
      startuper: true,
      votesNewStartup: {
        orderBy: { updatedAt: "desc" },
        include: { expert: true },
      },
      investments: {
        orderBy: { updatedAt: "desc" },
        include: { investor: true },
      },
      applicationsDeveloper: {
        orderBy: { updatedAt: "desc" },
        include: { developer: true },
      },
      developer: true,
    },
  });
  const maxApprovalData = await getStartupLeadingApplicationsDeveloper(
    startupId
  );
  const { maxApproval } = maxApprovalData;
  const maxApprovalApplicationsDeveloper =
    await db.applicationDeveloper.findMany({
      where: { id: { in: maxApprovalData.ids } },
      include: { developer: true },
    });
  if (!startup) {
    return json(
      { message: `Startup with this id not found: ${startupId}` },
      { status: 404 }
    );
  }
  const user = await getCurrentApiUser(request);
  return {
    id: startup.id,
    status: startup.status,
    startuper: {
      id: startup.startuper.id,
      email: startup.startuper.email,
      fullName: startup.startuper.fullName,
      avatarImageFile: startup.startuper.avatarImageFile,
    },
    targetFinancing: startup.targetFinancing,
    name: startup.name,
    description: startup.description,
    logoFile: startup.logoFile,
    specificationFile: startup.specificationFile,
    businessPlanFile: startup.businessPlanFile,
    presentationFile: startup.presentationFile,
    verification: await (async () => {
      if (!isStartupStatusSameOrLaterThan(startup.status, "verification")) {
        return null;
      }
      return {
        yeasTotal: await getNewStartupYeasTotal(startupId),
        naysTotal: await getNewStartupNaysTotal(startupId),
        yourVote: await (async () => {
          if (!user || user.role !== "expert") {
            return undefined;
          }
          const vote = await db.voteNewStartup.findUnique({
            where: { startupId_expertId: { startupId, expertId: user.id } },
          });
          if (!vote) {
            return null;
          }
          return {
            yea: vote.yea,
            nayReason: vote.nayReason,
          };
        })(),
      };
    })(),
    verification_failed: await (async () => {
      if (
        !isStartupStatusSameOrLaterThan(startup.status, "verification_failed")
      ) {
        return null;
      }
      return {
        nayVotes: await db.voteNewStartup.findMany({
          where: { startupId, yea: false },
          select: {
            id: true,
            nayReason: true,
            expert: {
              select: {
                id: true,
                fullName: true,
                email: true,
                avatarImageFile: true,
              },
            },
          },
        }),
      };
    })(),
    verification_succeded: await (async () => {
      if (
        !isStartupStatusSameOrLaterThan(startup.status, "verification_succeded")
      ) {
        return null;
      }
      return {};
    })(),
    financing: await (async () => {
      if (!isStartupStatusSameOrLaterThan(startup.status, "financing")) {
        return null;
      }
      const investmentsGroups = await db.investment.groupBy({
        where: { startupId: startup.id },
        by: ["investorId"],
        _sum: { amount: true },
      });
      return {
        financingDeadline: startup.financingDeadline,
        investmentsTotal: await getStartupTotalFinancing(startupId),
        investments: await Promise.all(
          investmentsGroups.map(async (investmentGroup) => {
            const investor = await db.user.findUnique({
              where: { id: investmentGroup.investorId },
              select: { id: true, fullName: true },
            });
            invariant(investor);
            return { investor, amount: investmentGroup._sum.amount ?? 0 };
          })
        ),
      };
    })(),
    financing_failed: await (async () => {
      if (!isStartupStatusSameOrLaterThan(startup.status, "financing_failed")) {
        return null;
      }
      return {};
    })(),
    financing_succeded: await (async () => {
      if (
        !isStartupStatusSameOrLaterThan(startup.status, "financing_succeded")
      ) {
        return null;
      }
      return {};
    })(),
    developerApplication: await (async () => {
      if (
        !isStartupStatusSameOrLaterThan(startup.status, "developerApplication")
      ) {
        return null;
      }
      return {
        developerApplicationDeadline: startup.developerApplicationDeadline,
        applications: await db.applicationDeveloper.findMany({
          where: { startupId },
          select: {
            id: true,
            message: true,
            developer: {
              select: { id: true, shortOrgName: true, email: true },
            },
          },
        }),
      };
    })(),
    developerVoting: await (async () => {
      if (!isStartupStatusSameOrLaterThan(startup.status, "developerVoting")) {
        return null;
      }
      return {
        developerVotingDeadline: startup.developerVotingDeadline,
        maxApproval,
        maxApprovalApplicationsDeveloper,
        applicationsDeveloper: await Promise.all(
          startup.applicationsDeveloper.map(async (applicationDeveloper) => ({
            ...applicationDeveloper,
            approval: await getApplicationDeveloperApproval(
              applicationDeveloper.id
            ),
          }))
        ),
      };
    })(),
  };
};
