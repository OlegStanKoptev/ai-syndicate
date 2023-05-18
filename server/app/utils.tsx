import type { StartupStatus, UserRole } from "@prisma/client";
import { useSearchParams, useTransition } from "@remix-run/react";
import { useEffect, useState } from "react";
import type { FieldValues, Path, UseFormSetFocus } from "react-hook-form";
import { useSpinDelay } from "~/components";
import superjson from "superjson";

export const startupVerificationYeaThreshold = 1; // 7
export const startupVerificationNayThreshold = 1; // 3

export const orderByValues = ["desc", "asc"] as const;
export type OrderBy = (typeof orderByValues)[number];

export const startupStatuses: readonly [StartupStatus, ...StartupStatus[]] = [
  "verification",
];
export const startupStatusNames: { [K in StartupStatus]: string } = {
  verification: "Verification",
  verification_failed: "Verification failed",
  verification_succeded: "Verification succeded",
  financing: "Financing",
  financing_failed: "Financing failed",
  financing_succeded: "Financing succeded",
  developerApplication: "Developer application",
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
