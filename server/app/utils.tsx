import type { StartupStatus, UserRole } from "@prisma/client";
import { useSearchParams, useTransition } from "@remix-run/react";
import { useEffect, useState } from "react";
import type { FieldValues, Path, UseFormSetFocus } from "react-hook-form";
import { useSpinDelay } from "~/components";
import superjson from "superjson";
import type { User as DbUser, Startup as DbStartup } from "@prisma/client";
import invariant from "tiny-invariant";

export const orderByValues = ["desc", "asc"] as const;
export type OrderBy = (typeof orderByValues)[number];

export const startupStatuses: readonly [StartupStatus, ...StartupStatus[]] = [
  "verification",
];
export const startupStatusNames: { [K in StartupStatus]: string } = {
  verification: "Verification",
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

export type User = {
  id: string;
  email: string;
  fullName: string;
} & (
  | { role: "admin" }
  | { role: "user"; balance: number; avatarImageFile: string | null }
  | { role: "expert" }
);

export function parseUser(user: DbUser): User {
  switch (user.role) {
    case "admin":
      return {
        id: user.id,
        role: "admin",
        email: user.email,
        fullName: user.fullName,
      };
    case "user":
      invariant(typeof user.balance === "number");
      return {
        id: user.id,
        role: "user",
        email: user.email,
        fullName: user.fullName,
        avatarImageFile: user.avatarImageFile,
        balance: user.balance,
      };
    case "expert":
      return {
        id: user.id,
        role: "expert",
        email: user.email,
        fullName: user.fullName,
      };
    default:
      invariant(false, `Wrong user role: ${user.role}`);
  }
}

export type Startup = {
  id: string;
  createdAt: Date;
  updatedAt: Date;
  startuperId: string;
  name: string;
  description: string;
  logoFile: string | null;
  specificationFile: string;
  businessPlanFile: string | null;
  presentationFile: string | null;
} & { status: "verification" };

export function parseStartup(startup: DbStartup): Startup {
  switch (startup.status) {
    case "verification":
      return {
        id: startup.id,
        status: "verification",
        createdAt: startup.createdAt,
        updatedAt: startup.updatedAt,
        startuperId: startup.startuperId,
        name: startup.name,
        description: startup.description,
        logoFile: startup.logoFile,
        specificationFile: startup.specificationFile,
        businessPlanFile: startup.businessPlanFile,
        presentationFile: startup.presentationFile,
      };
    default:
      invariant(false, `Wrong startup status: ${startup.status}`);
  }
}
