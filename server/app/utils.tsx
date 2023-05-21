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

export const startupVerificationYeaThreshold = 1; // 7
export const startupVerificationNayThreshold = 1; // 3

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
  if (data === undefined) {
    return undefined;
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

export async function populate() {
  for (let i = 0; i < 15; i++) {
    await axios.post(
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
    );
  }
  await axios.post("/api/user/join", {
    email: "user0@user0.com",
    password: "user0",
    fullName: "User 0",
    avatarImageFile: null,
  });
  await axios.post("/api/user/login", {
    email: "user0@user0.com",
    password: "user0",
  });
  await axios
    .post("/api/startup/new", {
      name: "Startup 0",
      description: "This is startup 0",
      logoFile: null,
      specificationFile: "tz1.pdf",
      businessPlanFile: null,
      presentationFile: null,
      targetFinancing: 300,
    })
    .then(({ data }) => data);
  // await axios.post(
  //   "/admin/users/new-expert",
  //   (() => {
  //     const formData = new FormData();
  //     formData.set("email", "expert@expert.com");
  //     formData.set("password", "expert");
  //     formData.set("fullName", "Expert Expertov");
  //     return formData;
  //   })(),
  //   {
  //     headers: { "Content-Type": "multipart/form-data" },
  //   }
  // );
  // await axios.post("/api/user/login", {
  //   email: "expert@expert.com",
  //   password: "expert",
  // });
  // await axios.post(`/api/startup/${startupId}/verification/vote`, {
  //   yea: true,
  // });
  // await axios.post("/api/user/login", {
  //   email: "startuper@startuper.com",
  //   password: "startuper",
  // });
  // await axios.post(`/api/startup/${startupId}/verification_succeded/confirm`, {
  //   financingDeadline: "2023-05-26T07:04:15.641Z",
  // });
  // await axios.post("/api/user/join", {
  //   email: "investor@investor.com",
  //   password: "investor",
  //   fullName: "Investor Investorov",
  //   avatarImageFile: null,
  // });
  // await axios.post("/api/user/login", {
  //   email: "investor@investor.com",
  //   password: "investor",
  // });
  // await axios.post("/api/user/deposit", { amount: 1000 });
  // await axios.post(`/api/startup/${startupId}/financing/invest`, {
  //   amount: 300,
  // });
  // await axios.post("/api/user/login", {
  //   email: "startuper@startuper.com",
  //   password: "startuper",
  // });
  // await axios.post(`/api/startup/${startupId}/financing_succeded/confirm`, {
  //   developerApplicationDeadline: "2023-05-27T07:04:15.641Z",
  // });
  // const { id: applicationId } = await axios
  //   .post("/api/user/developer/apply", {
  //     email: "developer@developer.com",
  //     password: "developer",
  //     phone: null,
  //     avatarImageFile: null,
  //     orgName: "AO Good Developers",
  //     shortOrgName: "Good Devs",
  //     inn: "5734241100",
  //     ogrn: "9027539198166",
  //     kpp: "271601001",
  //     legalAddress: "г. Москва, ул. Малая Бронная, д. 11, корпус 1",
  //     actualAddress: "г. Москва, ул. Малая Бронная, д. 11, корпус 1",
  //     website: "developers-228.com",
  //   })
  //   .then(({ data }) => data);
  // await axios.post(
  //   "/admin/application-new-developers",
  //   (() => {
  //     const formData = new FormData();
  //     formData.set("_action", "approve");
  //     formData.set("applicationId", applicationId);
  //     return formData;
  //   })(),
  //   {
  //     headers: { "Content-Type": "multipart/form-data" },
  //   }
  // );
  // await axios.post("/api/user/login", {
  //   email: "developer@developer.com",
  //   password: "developer",
  // });
  // await axios.post(`/api/startup/${startupId}/developer-application/new`, {
  //   message: "I will do it well",
  // });
  // await axios.post("/api/user/login", {
  //   email: "startuper@startuper.com",
  //   password: "startuper",
  // });
}
