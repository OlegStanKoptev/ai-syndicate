import type { LoaderFunction, MetaFunction } from "@remix-run/node";
import { Link, useCatch, useLoaderData, useNavigate } from "@remix-run/react";
import { db } from "~/db.server";
import { requireCurrentAdmin, validateRegistryParams } from "~/utils.server";
import type { TableColumn } from "~/components";
import { LinkButton } from "~/components";
import {
  ExpectedError,
  Pagination,
  UnexpectedError,
  Table,
} from "~/components";
import {
  deserialize,
  prepareTable,
  serialize,
  usePaginationSize,
  useSort,
  userRoleNames,
} from "~/utils";
import type { OrderBy } from "~/utils";
import type { User } from "@prisma/client";

const { columns, sortKeys, prepareColumn } = prepareTable({
  columns: ["id", "fullName", "email", "role", "shortOrgName"],
  sortKeys: ["fullName", "email", "role", "shortOrgName"],
});

type SortableColumnKey = (typeof sortKeys)[number];

type LoaderData = {
  users: User[];
  from: number;
  to: number;
  totalUsers: number;
  totalPages: number;
  size: number;
  sort?: {
    column: SortableColumnKey;
    orderBy: OrderBy;
  };
};

export const loader: LoaderFunction = async ({ request }) => {
  await requireCurrentAdmin(request);
  const { searchParams } = new URL(request.url);
  const { page, size, sortKey, orderBy } = validateRegistryParams(
    searchParams,
    sortKeys
  );
  const where = {};
  const totalUsers = await db.user.count({ where });
  const totalPages = Math.ceil(totalUsers / size);
  if (totalUsers > 0 && page + 1 > totalPages) {
    throw new Response(`Parameter page is incorrect: ${page}`, {
      status: 400,
    });
  }
  const users = await db.user.findMany({
    where,
    orderBy: (() => {
      if (!sortKey) {
        return { updatedAt: orderBy };
      }
      return { [sortKey]: orderBy };
    })(),
    skip: size * page,
    take: size,
  });
  const from = Math.min(totalUsers, size * page + 1);
  const to = Math.min(totalUsers, size * (page + 1));
  return new Response(
    serialize<LoaderData>({
      users,
      from,
      to,
      totalUsers,
      totalPages,
      size,
      sort: sortKey ? { column: sortKey, orderBy } : undefined,
    })
  );
};

export const meta: MetaFunction = () => {
  return {
    title: "AI Syndicate (admin) | Users",
  };
};

type TableColumnKey = (typeof columns)[number];
type TableRowData = LoaderData["users"][number];

export default function UsersIndex() {
  const data = deserialize<LoaderData>(useLoaderData());
  const navigate = useNavigate();
  const sort = useSort({ sort: data.sort });
  const { sizeChanging, onSizeChange } = usePaginationSize();
  const { users: tableData } = data;
  const tableColumns: TableColumn<TableRowData, TableColumnKey>[] = [
    { ...prepareColumn("id"), header: "Id", width: 210 },
    {
      ...prepareColumn("role"),
      header: "Role",
      cell: ({ row }) => userRoleNames[row.role],
      width: 200,
    },
    { ...prepareColumn("fullName"), header: "Full name" },
    { ...prepareColumn("email"), header: "Email", width: 225 },
    { ...prepareColumn("shortOrgName"), header: "Short org name" },
  ];
  return (
    <div className="m-4">
      <div className="mb-4 flex items-center gap-4">
        <h1 className="text-xl">
          Users{" "}
          <span className="text-sm">
            ({data.from}-{data.to} out of {data.totalUsers})
          </span>
        </h1>
        <LinkButton to="new-expert" size="sm">
          Create expert
        </LinkButton>
      </div>
      <div className="flex">
        <Table
          data={tableData}
          columns={tableColumns}
          onRowClick={({ row }) => navigate(row.id)}
          sort={sort}
          noDataFallback="No results"
          className="max-w-full overflow-auto"
        />
      </div>
      <Pagination
        total={data.totalPages}
        size={data.size}
        sizeChanging={sizeChanging}
        onSizeChange={onSizeChange}
        className="mt-4"
      />
    </div>
  );
}

export function CatchBoundary() {
  const caught = useCatch();
  console.error(caught);
  switch (caught.status) {
    case 400: {
      return (
        <ExpectedError className="m-4">
          <p>{caught.data}</p>
          <Link to="/admin/users" className="text-blue-300">
            Go to registry with default params
          </Link>
        </ExpectedError>
      );
    }
    default: {
      throw new Error(`Unhandled error: ${caught.status}`);
    }
  }
}

export function ErrorBoundary({ error }: { error: Error }) {
  console.error(error);
  return (
    <UnexpectedError
      error={error}
      tryAgainElement={
        <Link to="#" className="font-normal text-blue-300">
          Try again
        </Link>
      }
      className="mt-4"
    />
  );
}
