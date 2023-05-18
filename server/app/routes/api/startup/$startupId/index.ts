import type { Startup, User, VoteNewStartup } from "@prisma/client";
import type { LoaderFunction } from "@remix-run/server-runtime";
import { json } from "@remix-run/server-runtime";
import invariant from "tiny-invariant";
import { db } from "~/db.server";

type LoaderData = Startup & {
  newStartupVotes: (VoteNewStartup & {
    expert: User;
  })[];
};

export const loader: LoaderFunction = async ({ params }) => {
  const { startupId } = params;
  invariant(typeof startupId === "string");
  const startup = await db.startup.findUnique({ where: { id: startupId } });
  if (!startup) {
    return json(
      { message: `Startup with this id not found: ${startupId}` },
      { status: 404 }
    );
  }
  const newStartupVotes = await db.voteNewStartup.findMany({
    where: { startupId },
    include: { expert: true },
  });
  return json<LoaderData>({ ...startup, newStartupVotes });
};
