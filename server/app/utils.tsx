import type {
  ApplicationDeveloper,
  ApplicationNewDeveloperStatus,
  StartupStatus,
  UserRole,
} from "@prisma/client";
import { useSearchParams, useTransition } from "@remix-run/react";
import { useEffect, useState } from "react";
import type { FieldValues, Path, UseFormSetFocus } from "react-hook-form";
import { useSpinDelay } from "~/components";
import superjson from "superjson";
import axios from "axios";
import * as dateFns from "date-fns";

export const startupVerificationYeaThreshold = 7;
export const startupVerificationNayThreshold = 3;

export const reportVerificationYeaThreshold = 7;
export const reportVerificationNayThreshold = 3;

export const startuperWeight = 0.15;

export const orderByValues = ["desc", "asc"] as const;
export type OrderBy = (typeof orderByValues)[number];

export const startupStatuses: readonly [StartupStatus, ...StartupStatus[]] = [
  "verification",
  "verification_failed",
  "verification_succeded",
  "financing",
  "financing_failed",
  "financing_succeded",
  "developerApplication",
  "developerApplication_succeded",
  "developerVoting",
  "developerVoting_succeded",
  "development",
  "development_succeded",
  "finished",
];
export const startupStatusNames: { [K in StartupStatus]: string } = {
  verification: "Verification",
  verification_failed: "Verification failed",
  verification_succeded: "Verification succeded",
  financing: "Financing",
  financing_failed: "Financing failed",
  financing_succeded: "Financing succeded",
  developerApplication: "Developer application",
  developerApplication_succeded: "Developer application success",
  developerVoting: "Developer voting",
  developerVoting_succeded: "Developer voting succeded",
  development: "Development",
  development_succeded: "Development succeded",
  finished: "Finished",
};
type StartupStatusTree = { status: StartupStatus; after?: StartupStatusTree[] };
const startupStatusTree: StartupStatusTree = {
  status: "verification",
  after: [
    { status: "verification_failed" },
    {
      status: "verification_succeded",
      after: [
        {
          status: "financing",
          after: [
            { status: "financing_failed" },
            {
              status: "financing_succeded",
              after: [
                {
                  status: "developerApplication",
                  after: [
                    {
                      status: "developerApplication_succeded",
                      after: [
                        {
                          status: "developerVoting",
                          after: [
                            {
                              status: "developerVoting_succeded",
                              after: [
                                {
                                  status: "development",
                                  after: [
                                    {
                                      status: "development_succeded",
                                      after: [{ status: "finished" }],
                                    },
                                  ],
                                },
                              ],
                            },
                          ],
                        },
                      ],
                    },
                  ],
                },
              ],
            },
          ],
        },
      ],
    },
  ],
};
function getStartupStatusTree(
  status: StartupStatus,
  startupStatusTree: StartupStatusTree
): StartupStatusTree | null {
  if (startupStatusTree.status === status) {
    return startupStatusTree;
  }
  if (!startupStatusTree.after) {
    return null;
  }
  const afterResults = startupStatusTree.after.map((afterStartupStatusTree) =>
    getStartupStatusTree(status, afterStartupStatusTree)
  );
  return afterResults.find((afterResult) => !!afterResult) ?? null;
}
export function isStartupStatusSameOrLaterThan(
  status: StartupStatus,
  laterThanStatus: StartupStatus
) {
  return !!getStartupStatusTree(
    status,
    getStartupStatusTree(laterThanStatus, startupStatusTree)!
  );
}

export const userRoles: readonly [UserRole, ...UserRole[]] = [
  "admin",
  "developer",
  "expert",
  "user",
];
export const userRoleNames: { [K in UserRole]: string } = {
  admin: "Admin",
  developer: "Developer",
  expert: "Expert",
  user: "User",
};

export const applicationNewDeveloperStatuses: readonly [
  ApplicationNewDeveloperStatus,
  ...ApplicationNewDeveloperStatus[]
] = ["new", "declined", "approved"];
export const applicationNewDeveloperStatusNames: {
  [K in ApplicationNewDeveloperStatus]: string;
} = {
  new: "New",
  declined: "Declined",
  approved: "Approved",
};

export function serialize<T = any>(data: T) {
  return superjson.stringify(data);
}
export function deserialize<T = any>(data: string): T;
export function deserialize<T = any>(data: string | undefined): T | undefined;
export function deserialize<T = any>(data: string | undefined) {
  if (data === undefined || data === "" || data === null) {
    return data;
  }
  return superjson.parse<T>(data);
}

export function formatDate(
  date: Date | string,
  { time = true }: { time?: boolean } = {}
) {
  const dateObject = typeof date === "string" ? new Date(date) : date;
  return new Intl.DateTimeFormat("ru-RU", {
    dateStyle: "short",
    timeStyle: time ? "short" : undefined,
  }).format(new Date(dateObject));
}

export function formatUrl(url: string) {
  try {
    const urlObj = new URL(url);
    if (urlObj.protocol === "http:" || urlObj.protocol === "https:") {
      return url;
    }
    return `https://${url}`;
  } catch {
    return `https://${url}`;
  }
}

let hydrating = true;
export function useHydrated() {
  let [hydrated, setHydrated] = useState(() => !hydrating);

  useEffect(function hydrate() {
    hydrating = false;
    setHydrated(true);
  }, []);

  return hydrated;
}

export function useFocusFieldOnServerValidationError<T extends FieldValues>({
  actionData,
  setFocus,
}: {
  actionData: { errors: { [fieldName: string]: string } } | undefined;
  setFocus: UseFormSetFocus<T>;
}) {
  useEffect(() => {
    const firstServerErrorFieldName = actionData
      ? (Object.keys(actionData.errors)[0] as Path<T>)
      : undefined;
    if (firstServerErrorFieldName) {
      setFocus(firstServerErrorFieldName);
    }
  }, [actionData, setFocus]);
}

export function usePaginationSize() {
  const transition = useTransition();
  const [searchParams, setSearchParams] = useSearchParams();
  const isSizeChanging =
    transition.state === "loading" &&
    transition.location.state?.type === "size";
  const showSpinner = useSpinDelay(isSizeChanging);
  const sizeChanging = isSizeChanging
    ? {
        size: transition.location.state.size,
        showSpinner,
      }
    : undefined;
  const onSizeChange = (size: number) => {
    if (size === 10) {
      searchParams.delete("size");
    } else {
      searchParams.set("size", String(size));
    }
    setSearchParams(searchParams, { state: { type: "size", size } });
  };
  return { sizeChanging, onSizeChange };
}

export function useSort<TCol>({
  sort,
}: {
  sort?: {
    column: TCol;
    orderBy: OrderBy;
  };
}) {
  const transition = useTransition();
  const [searchParams, setSearchParams] = useSearchParams();
  const isSorting =
    transition.state === "loading" &&
    transition.location.state?.type === "sort";
  const showSpinner = useSpinDelay(isSorting);
  const by = sort
    ? {
        colId: sort.column,
        orderBy: sort.orderBy,
      }
    : undefined;
  const sorting = isSorting
    ? {
        colId: transition.location.state.colId,
        orderBy: transition.location.state.orderBy,
        showSpinner,
      }
    : undefined;
  const onSort = ({
    colId,
    orderBy,
  }: {
    colId: string;
    orderBy: OrderBy | null;
  }) => {
    if (!orderBy) {
      searchParams.delete("sortKey");
      searchParams.delete("orderBy");
    }
    if (orderBy === "asc") {
      searchParams.set("sortKey", colId);
      searchParams.set("orderBy", "asc");
    }
    if (orderBy === "desc") {
      searchParams.set("sortKey", colId);
      searchParams.delete("orderBy");
    }
    setSearchParams(searchParams, { state: { type: "sort", colId, orderBy } });
  };
  return { by, sorting, onSort };
}

export function prepareTable<T extends string, U extends T>({
  columns,
  sortKeys,
}: {
  columns: T[];
  sortKeys: [U, ...U[]];
}) {
  const prepareColumn = (id: T) => {
    return { id, sortable: (sortKeys as T[]).includes(id) };
  };
  return { columns, sortKeys, prepareColumn };
}

function getRandomInt(from: number, to: number) {
  return from + Math.floor(Math.random() * to);
}

export async function populate() {
  const newClientDate = async (date?: Date) => {
    const additionalSeconds: number = await axios
      .get("/api/config/additional-seconds")
      .then(({ data }) => data);
    return dateFns.addSeconds(date ?? new Date(), additionalSeconds);
  };
  const waitDays = async (days: number) => {
    await axios.post(
      "/admin/spec",
      (() => {
        const formData = new FormData();
        formData.set("_action", "add-days");
        formData.set("amount", String(days));
        return formData;
      })(),
      {
        headers: { "Content-Type": "multipart/form-data" },
      }
    );
  };
  const createExperts = async ({ count }: { count: number }) => {
    await Promise.all(
      Array(count)
        .fill(null)
        .map((_, i) =>
          axios.post(
            "/admin/users/new-expert",
            (() => {
              const formData = new FormData();
              formData.set("email", `expert${i}-ais@mail.ru`);
              formData.set("password", `expert${i}`);
              formData.set("fullName", `Expert ${i}`);
              return formData;
            })(),
            {
              headers: { "Content-Type": "multipart/form-data" },
            }
          )
        )
    );
  };
  const createUsers = async ({ count }: { count: number }) => {
    await Promise.all(
      Array(count)
        .fill(null)
        .map((_, i) => {
          return axios.post("/api/user/join", {
            email: `user${i}-ais@mail.ru`,
            password: `user${i}`,
            fullName: `User ${i}`,
            avatarImageFile: null,
          });
        })
    );
  };
  const createDevelopers = async ({
    createCount,
    declineCount,
    ignoreCount,
  }: {
    createCount: number;
    declineCount: number;
    ignoreCount: number;
  }) => {
    await Promise.all(
      Array(createCount + declineCount + ignoreCount)
        .fill(null)
        .map(async (_, i) => {
          const j = i % 10;
          const { id: applicationId } = await axios
            .post("/api/user/developer/apply", {
              email: `developer${i}-ais@mail.ru`,
              password: `developer${i}`,
              phone: null,
              avatarImageFile: null,
              orgName: `AO Developer ${i}`,
              shortOrgName: `Good Devs ${i}`,
              inn: `${j}${j}${j}${j}${j}${j}${j}${j}${j}${j}`,
              ogrn: `${j}${j}${j}${j}${j}${j}${j}${j}${j}${j}${j}${j}${j}`,
              kpp: `${j}${j}${j}${j}${j}${j}${j}${j}${j}`,
              legalAddress: `Address ${i}`,
              actualAddress: `Address ${i}`,
              website: `developer${i}-site.com`,
            })
            .then(({ data }) => data);
          if (i < createCount) {
            await axios.post(
              `/admin/applications-new-developer/${applicationId}?index`,
              (() => {
                const formData = new FormData();
                formData.set("_action", "approve");
                return formData;
              })(),
              {
                headers: { "Content-Type": "multipart/form-data" },
              }
            );
          } else if (i < createCount + declineCount) {
            await axios.post(
              `/admin/applications-new-developer/${applicationId}/decline`,
              (() => {
                const formData = new FormData();
                formData.set("declineReason", `Decline reason ${i}`);
                return formData;
              })(),
              {
                headers: { "Content-Type": "multipart/form-data" },
              }
            );
          }
        })
    );
  };
  const loginUser = async ({ userNumber }: { userNumber: number }) => {
    await axios.post("/api/user/login", {
      email: `user${userNumber}-ais@mail.ru`,
      password: `user${userNumber}`,
    });
  };
  const startupIdsByNumbers: { [key: number]: string } = {};
  const createStartup = async ({
    userNumber,
    startupNumber,
    targetFinancing,
  }: {
    userNumber: number;
    startupNumber: number;
    targetFinancing?: number;
  }) => {
    await loginUser({ userNumber });
    const { id } = await axios
      .post("/api/startup/new", {
        name: `Startup ${startupNumber}`,
        description: `This is startup ${startupNumber}`,
        logoFile: null,
        specificationFile: "tz1.pdf",
        businessPlanFile: null,
        presentationFile: null,
        targetFinancing: targetFinancing ?? getRandomInt(100, 700),
      })
      .then(({ data }) => data);
    startupIdsByNumbers[startupNumber] = id;
    return id;
  };
  const loginExpert = async ({ expertNumber }: { expertNumber: number }) => {
    await axios.post("/api/user/login", {
      email: `expert${expertNumber}-ais@mail.ru`,
      password: `expert${expertNumber}`,
    });
  };
  const loginDeveloper = async ({
    developerNumber,
  }: {
    developerNumber: number;
  }) => {
    await axios.post("/api/user/login", {
      email: `developer${developerNumber}-ais@mail.ru`,
      password: `developer${developerNumber}`,
    });
  };
  const voteForStartup = async ({
    startupNumber,
    outcome = "success",
  }: {
    startupNumber: number;
    outcome: "success" | "fail" | "unfinished";
  }) => {
    if (outcome === "success") {
      for (
        let i = 0;
        i <
        startupVerificationYeaThreshold + startupVerificationNayThreshold - 1;
        i++
      ) {
        await loginExpert({ expertNumber: i });
        if (i < startupVerificationNayThreshold - 1) {
          await axios.post(
            `/api/startup/${startupIdsByNumbers[startupNumber]}/verification/vote`,
            {
              yea: false,
              nayReason: `Nay reason ${i}`,
            }
          );
        } else {
          await axios.post(
            `/api/startup/${startupIdsByNumbers[startupNumber]}/verification/vote`,
            {
              yea: true,
            }
          );
        }
      }
    } else if (outcome === "fail") {
      for (
        let i = 0;
        i <
        startupVerificationYeaThreshold + startupVerificationNayThreshold - 1;
        i++
      ) {
        await loginExpert({ expertNumber: i });
        if (i < startupVerificationYeaThreshold - 1) {
          await axios.post(
            `/api/startup/${startupIdsByNumbers[startupNumber]}/verification/vote`,
            {
              yea: true,
            }
          );
        } else {
          await axios.post(
            `/api/startup/${startupIdsByNumbers[startupNumber]}/verification/vote`,
            {
              yea: false,
              nayReason: `Nay reason ${i}`,
            }
          );
        }
      }
    } else if (outcome === "unfinished") {
      for (
        let i = 0;
        i <
        startupVerificationYeaThreshold +
          startupVerificationNayThreshold -
          1 -
          1;
        i++
      ) {
        await loginExpert({ expertNumber: i });
        if (i < startupVerificationYeaThreshold - 1) {
          await axios.post(
            `/api/startup/${startupIdsByNumbers[startupNumber]}/verification/vote`,
            {
              yea: true,
            }
          );
        } else {
          await axios.post(
            `/api/startup/${startupIdsByNumbers[startupNumber]}/verification/vote`,
            {
              yea: false,
              nayReason: `Nay reason ${i}`,
            }
          );
        }
      }
    } else {
      throw new Error(`Unexpected outcome : ${outcome}`);
    }
  };
  const confirmVerificationOfStartup = async ({
    userNumber,
    startupNumber,
    daysToFinancingDeadline,
  }: {
    userNumber: number;
    startupNumber: number;
    daysToFinancingDeadline?: number;
  }) => {
    await loginUser({ userNumber });
    await axios.post(
      `/api/startup/${startupIdsByNumbers[startupNumber]}/verification_succeded/confirm`,
      {
        financingDeadline: dateFns.addDays(
          await newClientDate(),
          daysToFinancingDeadline ?? 14
        ),
      }
    );
  };
  const getStartupInfo = async ({
    startupNumber,
  }: {
    startupNumber: number;
  }) => {
    return axios
      .get(`/api/startup/${startupIdsByNumbers[startupNumber]}`)
      .then(({ data }) => data);
  };
  const deposit = async ({
    userNumber,
    amount = 1000,
  }: {
    userNumber: number;
    amount?: number;
  }) => {
    await loginUser({ userNumber });
    await axios.post("/api/user/deposit", { amount });
  };
  const investInStartup = async ({
    startupNumber,
    outcome,
  }: {
    startupNumber: number;
    outcome: "success" | "fail" | "unfinished";
  }) => {
    const {
      targetFinancing,
      financing: { financingDeadline },
    }: { targetFinancing: number; financing: { financingDeadline: string } } =
      await getStartupInfo({ startupNumber });
    const part1 = Math.floor(targetFinancing / 2);
    const part2 = Math.floor((targetFinancing - part1) / 2);
    const part3 = targetFinancing - part1 - part2;
    await loginUser({ userNumber: 5 });
    await deposit({ userNumber: 5, amount: part1 });
    await axios.post(
      `/api/startup/${startupIdsByNumbers[startupNumber]}/financing/invest`,
      {
        amount: part1,
      }
    );
    await loginUser({ userNumber: 6 });
    await deposit({ userNumber: 6, amount: part2 });
    await axios.post(
      `/api/startup/${startupIdsByNumbers[startupNumber]}/financing/invest`,
      {
        amount: part2,
      }
    );
    if (outcome === "success") {
      await loginUser({ userNumber: 7 });
      await deposit({ userNumber: 7, amount: part3 });
      await axios.post(
        `/api/startup/${startupIdsByNumbers[startupNumber]}/financing/invest`,
        {
          amount: part3,
        }
      );
    } else if (outcome === "fail") {
      const daysToWait =
        1 +
        dateFns.differenceInDays(
          new Date(financingDeadline),
          await newClientDate()
        );
      await waitDays(daysToWait);
    } else if (outcome === "unfinished") {
      return;
    } else {
      throw new Error(`Unexpected outcome: ${outcome}`);
    }
  };
  const confirmFinancingOfStartup = async ({
    userNumber,
    startupNumber,
    daysToDeveloperApplicationDeadline,
  }: {
    userNumber: number;
    startupNumber: number;
    daysToDeveloperApplicationDeadline?: number;
  }) => {
    await loginUser({ userNumber });
    await axios.post(
      `/api/startup/${startupIdsByNumbers[startupNumber]}/financing_succeded/confirm`,
      {
        developerApplicationDeadline: dateFns.addDays(
          await newClientDate(),
          daysToDeveloperApplicationDeadline ?? 14
        ),
      }
    );
  };
  const applyAsDevelopers = async ({
    count,
    startupNumber,
  }: {
    count: number;
    startupNumber: number;
  }) => {
    for (let i = 0; i < count; i++) {
      await loginDeveloper({ developerNumber: i });
      await axios.post(
        `/api/startup/${startupIdsByNumbers[startupNumber]}/developer-application/new`,
        {
          message: `I will do it well ${i}`,
        }
      );
    }
  };
  const waitForDeveloperApplicationDeadline = async ({
    startupNumber,
  }: {
    startupNumber: number;
  }) => {
    const {
      developerApplication: { developerApplicationDeadline },
    }: { developerApplication: { developerApplicationDeadline: string } } =
      await getStartupInfo({
        startupNumber,
      });
    const daysToWait =
      1 +
      dateFns.differenceInDays(
        new Date(developerApplicationDeadline),
        await newClientDate()
      );
    await waitDays(daysToWait);
  };
  const confirmDeveloperApplicationOfStartup = async ({
    userNumber,
    startupNumber,
    daysToDeveloperVotingDeadline,
  }: {
    userNumber: number;
    startupNumber: number;
    daysToDeveloperVotingDeadline?: number;
  }) => {
    await loginUser({ userNumber });
    await axios.post(
      `/api/startup/${startupIdsByNumbers[startupNumber]}/developer-application_succeded/confirm`,
      {
        developerVotingDeadline: dateFns.addDays(
          await newClientDate(),
          daysToDeveloperVotingDeadline ?? 14
        ),
      }
    );
  };
  const voteForDevelopers = async ({
    startupNumber,
  }: {
    startupNumber: number;
  }) => {
    const applicationsDeveloper: ApplicationDeveloper[] = await axios
      .get(
        `/api/startup/${startupIdsByNumbers[startupNumber]}/developer-application/list`
      )
      .then(({ data }) => data);
    for (let i = 0; i < applicationsDeveloper.length; i++) {
      if (i >= 3) {
        return;
      }
      if (i === 1) {
        await loginUser({ userNumber: 0 });
        await axios.post(
          `/api/startup/${startupIdsByNumbers[startupNumber]}/developer-voting/vote`,
          { applicationDeveloperId: applicationsDeveloper[i].id }
        );
      }
      for (let j = 5; j < 8 - i; j++) {
        await loginUser({ userNumber: j });
        await axios.post(
          `/api/startup/${startupIdsByNumbers[startupNumber]}/developer-voting/vote`,
          { applicationDeveloperId: applicationsDeveloper[i].id }
        );
      }
    }
  };
  const waitForDeveloperVotingDeadline = async ({
    startupNumber,
  }: {
    startupNumber: number;
  }) => {
    const {
      developerVoting: { developerVotingDeadline },
    }: { developerVoting: { developerVotingDeadline: string } } =
      await getStartupInfo({
        startupNumber,
      });
    const daysToWait =
      1 +
      dateFns.differenceInDays(
        new Date(developerVotingDeadline),
        await newClientDate()
      );
    await waitDays(daysToWait);
  };
  const confirmDeveloperVotingOfStartup = async ({
    userNumber,
    startupNumber,
    daysToDevelopmentDeadline,
  }: {
    userNumber: number;
    startupNumber: number;
    daysToDevelopmentDeadline?: number;
  }) => {
    await loginUser({ userNumber });
    const { ids } = await axios
      .get(
        `/api/startup/${startupIdsByNumbers[startupNumber]}/developer-voting_succeded/leaders`
      )
      .then(({ data }) => data);
    await axios.post(
      `/api/startup/${startupIdsByNumbers[startupNumber]}/developer-voting_succeded/confirm`,
      {
        developmentDeadline: dateFns.addDays(
          await newClientDate(),
          daysToDevelopmentDeadline ?? 14
        ),
        applicationDeveloperId: ids[0],
      }
    );
  };
  const fileReport = async ({ startupNumber }: { startupNumber: number }) => {
    await loginDeveloper({ developerNumber: 0 });
    await axios.post(
      `/api/startup/${startupIdsByNumbers[startupNumber]}/development/report`,
      { reportFile: "reportFile1.pdf" }
    );
  };
  const voteForReport = async ({
    startupNumber,
    outcome = "success",
  }: {
    startupNumber: number;
    outcome: "success" | "fail" | "unfinished";
  }) => {
    if (outcome === "success") {
      for (
        let i = 0;
        i <
        startupVerificationYeaThreshold + startupVerificationNayThreshold - 1;
        i++
      ) {
        await loginExpert({ expertNumber: i });
        if (i < startupVerificationNayThreshold - 1) {
          await axios.post(
            `/api/startup/${startupIdsByNumbers[startupNumber]}/development/vote`,
            {
              yea: false,
              nayReason: `Nay reason ${i}`,
            }
          );
        } else {
          await axios.post(
            `/api/startup/${startupIdsByNumbers[startupNumber]}/development/vote`,
            {
              yea: true,
            }
          );
        }
      }
    } else if (outcome === "fail") {
      for (
        let i = 0;
        i <
        startupVerificationYeaThreshold + startupVerificationNayThreshold - 1;
        i++
      ) {
        await loginExpert({ expertNumber: i });
        if (i < startupVerificationYeaThreshold - 1) {
          await axios.post(
            `/api/startup/${startupIdsByNumbers[startupNumber]}/development/vote`,
            {
              yea: true,
            }
          );
        } else {
          await axios.post(
            `/api/startup/${startupIdsByNumbers[startupNumber]}/development/vote`,
            {
              yea: false,
              nayReason: `Nay reason ${i}`,
            }
          );
        }
      }
    } else if (outcome === "unfinished") {
      for (
        let i = 0;
        i <
        startupVerificationYeaThreshold +
          startupVerificationNayThreshold -
          1 -
          1;
        i++
      ) {
        await loginExpert({ expertNumber: i });
        if (i < startupVerificationYeaThreshold - 1) {
          await axios.post(
            `/api/startup/${startupIdsByNumbers[startupNumber]}/development/vote`,
            {
              yea: true,
            }
          );
        } else {
          await axios.post(
            `/api/startup/${startupIdsByNumbers[startupNumber]}/development/vote`,
            {
              yea: false,
              nayReason: `Nay reason ${i}`,
            }
          );
        }
      }
    } else {
      throw new Error(`Unexpected outcome : ${outcome}`);
    }
  };
  const confirmDevelopmentOfStartup = async ({
    userNumber,
    startupNumber,
  }: {
    userNumber: number;
    startupNumber: number;
  }) => {
    await loginUser({ userNumber });
    await axios.post(
      `/api/startup/${startupIdsByNumbers[startupNumber]}/development_succeded/confirm`
    );
  };
  await createExperts({
    count:
      startupVerificationYeaThreshold + startupVerificationNayThreshold - 1,
  });
  await createUsers({ count: 10 });
  await createDevelopers({ createCount: 10, declineCount: 4, ignoreCount: 2 });
  await createStartup({ userNumber: 0, startupNumber: 0 });
  await voteForStartup({ startupNumber: 0, outcome: "unfinished" });
  await createStartup({ userNumber: 0, startupNumber: 1 });
  await voteForStartup({ startupNumber: 1, outcome: "fail" });
  await createStartup({ userNumber: 0, startupNumber: 2 });
  await voteForStartup({ startupNumber: 2, outcome: "success" });
  await createStartup({ userNumber: 0, startupNumber: 3 });
  await voteForStartup({ startupNumber: 3, outcome: "success" });
  await confirmVerificationOfStartup({
    userNumber: 0,
    startupNumber: 3,
    daysToFinancingDeadline: 150,
  });
  await investInStartup({ startupNumber: 3, outcome: "unfinished" });
  await createStartup({ userNumber: 0, startupNumber: 4 });
  await voteForStartup({ startupNumber: 4, outcome: "success" });
  await confirmVerificationOfStartup({
    userNumber: 0,
    startupNumber: 4,
    daysToFinancingDeadline: 4,
  });
  await investInStartup({ startupNumber: 4, outcome: "fail" });
  await createStartup({ userNumber: 0, startupNumber: 5 });
  await voteForStartup({ startupNumber: 5, outcome: "success" });
  await confirmVerificationOfStartup({
    userNumber: 0,
    startupNumber: 5,
    daysToFinancingDeadline: 100,
  });
  await investInStartup({ startupNumber: 5, outcome: "success" });
  await createStartup({ userNumber: 0, startupNumber: 6 });
  await voteForStartup({ startupNumber: 6, outcome: "success" });
  await confirmVerificationOfStartup({
    userNumber: 0,
    startupNumber: 6,
    daysToFinancingDeadline: 100,
  });
  await investInStartup({ startupNumber: 6, outcome: "success" });
  await confirmFinancingOfStartup({
    userNumber: 0,
    startupNumber: 6,
    daysToDeveloperApplicationDeadline: 100,
  });
  await applyAsDevelopers({ count: 4, startupNumber: 6 });
  await createStartup({ userNumber: 0, startupNumber: 7 });
  await voteForStartup({ startupNumber: 7, outcome: "success" });
  await confirmVerificationOfStartup({
    userNumber: 0,
    startupNumber: 7,
    daysToFinancingDeadline: 80,
  });
  await investInStartup({ startupNumber: 7, outcome: "success" });
  await confirmFinancingOfStartup({
    userNumber: 0,
    startupNumber: 7,
    daysToDeveloperApplicationDeadline: 5,
  });
  await applyAsDevelopers({ count: 3, startupNumber: 7 });
  await waitForDeveloperApplicationDeadline({ startupNumber: 7 });
  await createStartup({ userNumber: 0, startupNumber: 8 });
  await voteForStartup({ startupNumber: 8, outcome: "success" });
  await confirmVerificationOfStartup({
    userNumber: 0,
    startupNumber: 8,
    daysToFinancingDeadline: 80,
  });
  await investInStartup({ startupNumber: 8, outcome: "success" });
  await confirmFinancingOfStartup({
    userNumber: 0,
    startupNumber: 8,
    daysToDeveloperApplicationDeadline: 5,
  });
  await applyAsDevelopers({ count: 3, startupNumber: 8 });
  await waitForDeveloperApplicationDeadline({ startupNumber: 8 });
  await confirmDeveloperApplicationOfStartup({
    userNumber: 0,
    startupNumber: 8,
    daysToDeveloperVotingDeadline: 75,
  });
  await voteForDevelopers({ startupNumber: 8 });
  await createStartup({ userNumber: 0, startupNumber: 9 });
  await voteForStartup({ startupNumber: 9, outcome: "success" });
  await confirmVerificationOfStartup({
    userNumber: 0,
    startupNumber: 9,
    daysToFinancingDeadline: 90,
  });
  await investInStartup({ startupNumber: 9, outcome: "success" });
  await confirmFinancingOfStartup({
    userNumber: 0,
    startupNumber: 9,
    daysToDeveloperApplicationDeadline: 5,
  });
  await applyAsDevelopers({ count: 3, startupNumber: 9 });
  await waitForDeveloperApplicationDeadline({ startupNumber: 9 });
  await confirmDeveloperApplicationOfStartup({
    userNumber: 0,
    startupNumber: 9,
    daysToDeveloperVotingDeadline: 5,
  });
  await voteForDevelopers({ startupNumber: 9 });
  await waitForDeveloperVotingDeadline({ startupNumber: 9 });
  await createStartup({ userNumber: 0, startupNumber: 10 });
  await voteForStartup({ startupNumber: 10, outcome: "success" });
  await confirmVerificationOfStartup({
    userNumber: 0,
    startupNumber: 10,
    daysToFinancingDeadline: 100,
  });
  await investInStartup({ startupNumber: 10, outcome: "success" });
  await confirmFinancingOfStartup({
    userNumber: 0,
    startupNumber: 10,
    daysToDeveloperApplicationDeadline: 5,
  });
  await applyAsDevelopers({ count: 3, startupNumber: 10 });
  await waitForDeveloperApplicationDeadline({ startupNumber: 10 });
  await confirmDeveloperApplicationOfStartup({
    userNumber: 0,
    startupNumber: 10,
    daysToDeveloperVotingDeadline: 5,
  });
  await voteForDevelopers({ startupNumber: 10 });
  await waitForDeveloperVotingDeadline({ startupNumber: 10 });
  await confirmDeveloperVotingOfStartup({
    userNumber: 0,
    startupNumber: 10,
    daysToDevelopmentDeadline: 6,
  });
  await fileReport({ startupNumber: 10 });
  await voteForReport({ startupNumber: 10, outcome: "fail" });
  await fileReport({ startupNumber: 10 });
  await voteForReport({ startupNumber: 10, outcome: "unfinished" });
  await createStartup({ userNumber: 0, startupNumber: 11 });
  await voteForStartup({ startupNumber: 11, outcome: "success" });
  await confirmVerificationOfStartup({
    userNumber: 0,
    startupNumber: 11,
    daysToFinancingDeadline: 110,
  });
  await investInStartup({ startupNumber: 11, outcome: "success" });
  await confirmFinancingOfStartup({
    userNumber: 0,
    startupNumber: 11,
    daysToDeveloperApplicationDeadline: 5,
  });
  await applyAsDevelopers({ count: 3, startupNumber: 11 });
  await waitForDeveloperApplicationDeadline({ startupNumber: 11 });
  await confirmDeveloperApplicationOfStartup({
    userNumber: 0,
    startupNumber: 11,
    daysToDeveloperVotingDeadline: 5,
  });
  await voteForDevelopers({ startupNumber: 11 });
  await waitForDeveloperVotingDeadline({ startupNumber: 11 });
  await confirmDeveloperVotingOfStartup({
    userNumber: 0,
    startupNumber: 11,
    daysToDevelopmentDeadline: 6,
  });
  await fileReport({ startupNumber: 11 });
  await voteForReport({ startupNumber: 11, outcome: "fail" });
  await fileReport({ startupNumber: 11 });
  await voteForReport({ startupNumber: 11, outcome: "success" });
  await createStartup({ userNumber: 0, startupNumber: 12 });
  await voteForStartup({ startupNumber: 12, outcome: "success" });
  await confirmVerificationOfStartup({
    userNumber: 0,
    startupNumber: 12,
    daysToFinancingDeadline: 120,
  });
  await investInStartup({ startupNumber: 12, outcome: "success" });
  await confirmFinancingOfStartup({
    userNumber: 0,
    startupNumber: 12,
    daysToDeveloperApplicationDeadline: 5,
  });
  await applyAsDevelopers({ count: 3, startupNumber: 12 });
  await waitForDeveloperApplicationDeadline({ startupNumber: 12 });
  await confirmDeveloperApplicationOfStartup({
    userNumber: 0,
    startupNumber: 12,
    daysToDeveloperVotingDeadline: 5,
  });
  await voteForDevelopers({ startupNumber: 12 });
  await waitForDeveloperVotingDeadline({ startupNumber: 12 });
  await confirmDeveloperVotingOfStartup({
    userNumber: 0,
    startupNumber: 12,
    daysToDevelopmentDeadline: 6,
  });
  await fileReport({ startupNumber: 12 });
  await voteForReport({ startupNumber: 12, outcome: "fail" });
  await fileReport({ startupNumber: 12 });
  await voteForReport({ startupNumber: 12, outcome: "success" });
  await confirmDevelopmentOfStartup({
    userNumber: 0,
    startupNumber: 12,
  });
}
