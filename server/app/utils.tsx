import type {
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
  "developerVoting",
];
export const startupStatusNames: { [K in StartupStatus]: string } = {
  verification: "Verification",
  verification_failed: "Verification failed",
  verification_succeded: "Verification succeded",
  financing: "Financing",
  financing_failed: "Financing failed",
  financing_succeded: "Financing succeded",
  developerApplication: "Developer application",
  developerVoting: "Developer voting",
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
                  after: [{ status: "developerVoting" }],
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
              formData.set("email", `expert${i}@expert${i}.com`);
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
        .map((_, i) =>
          axios.post("/api/user/join", {
            email: `user${i}@user${i}.com`,
            password: `user${i}`,
            fullName: `User ${i}`,
            avatarImageFile: null,
          })
        )
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
              email: `developer${i}@developer${i}.com`,
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
      email: `user${userNumber}@user${userNumber}.com`,
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
      email: `expert${expertNumber}@expert${expertNumber}.com`,
      password: `expert${expertNumber}`,
    });
  };
  const loginDeveloper = async ({
    developerNumber,
  }: {
    developerNumber: number;
  }) => {
    await axios.post("/api/user/login", {
      email: `developer${developerNumber}@developer${developerNumber}.com`,
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
  // await axios.post("/api/user/login", {
  //   email: "startuper@startuper.com",
  //   password: "startuper",
  // });
}
