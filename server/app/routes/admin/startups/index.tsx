import type { LoaderFunction, MetaFunction } from "@remix-run/node";
import {
  Link,
  useCatch,
  useLoaderData,
  useNavigate,
  useSearchParams,
} from "@remix-run/react";
import { db } from "~/db.server";
import {
  requireCurrentAdmin,
  validateRegistryParams,
  validateSingleParameter,
} from "~/utils.server";
import type { TableColumn } from "~/components";
import { Select } from "~/components";
import { Clamp } from "~/components";
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
  startupStatuses,
  startupStatusNames,
  usePaginationSize,
  useSort,
} from "~/utils";
import type { OrderBy } from "~/utils";
import type { Startup } from "@prisma/client";
import { z } from "zod";

const { columns, sortKeys, prepareColumn } = prepareTable({
  columns: ["id", "name", "status", "startuper"],
  sortKeys: ["name", "status", "startuper"],
});

type SortableColumnKey = (typeof sortKeys)[number];

type LoaderData = {
  startups: (Startup & {
    startuper: {
      id: string;
      email: string;
      fullName: string;
    };
  })[];
  from: number;
  to: number;
  totalStartups: number;
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
  const status = validateSingleParameter({
    value: searchParams.get("status") ?? undefined,
    schema: z.enum(startupStatuses).optional(),
    throw_: new Response(
      `Parameter status is incorrect: ${searchParams.get("status")}`,
      { status: 400 }
    ),
  });
  const where = { status };
  const totalStartups = await db.startup.count({ where });
  const totalPages = Math.ceil(totalStartups / size);
  if (totalStartups > 0 && page + 1 > totalPages) {
    throw new Response(`Parameter page is incorrect: ${page}`, {
      status: 400,
    });
  }
  const startups = await db.startup.findMany({
    where,
    orderBy: (() => {
      if (!sortKey) {
        return { updatedAt: orderBy };
      }
      if (sortKey === "startuper") {
        return [
          { startuper: { email: orderBy } },
          { startuper: { fullName: orderBy } },
        ];
      }
      return { [sortKey]: orderBy };
    })(),
    skip: size * page,
    take: size,
    include: {
      startuper: {
        select: { id: true, fullName: true, email: true },
      },
    },
  });
  const from = Math.min(totalStartups, size * page + 1);
  const to = Math.min(totalStartups, size * (page + 1));
  return new Response(
    serialize<LoaderData>({
      startups,
      from,
      to,
      totalStartups,
      totalPages,
      size,
      sort: sortKey ? { column: sortKey, orderBy } : undefined,
    })
  );
};

export const meta: MetaFunction = () => {
  return {
    title: "AI Syndicate (admin) | Startups",
  };
};

type TableColumnKey = (typeof columns)[number];
type TableRowData = LoaderData["startups"][number];

export default function StartupsIndex() {
  const data = deserialize<LoaderData>(useLoaderData());
  const navigate = useNavigate();
  const [searchParams, setSearchParams] = useSearchParams();
  const sort = useSort({ sort: data.sort });
  const { sizeChanging, onSizeChange } = usePaginationSize();
  const { startups: tableData } = data;
  const tableColumns: TableColumn<TableRowData, TableColumnKey>[] = [
    { ...prepareColumn("id"), header: "Id", width: 210 },
    {
      ...prepareColumn("status"),
      header: "Status",
      cell: ({ row }) => startupStatusNames[row.status],
    },
    { ...prepareColumn("name"), header: "Name" },
    {
      ...prepareColumn("startuper"),
      header: "Startuper",
      cell: ({ row }) => (
        <Clamp title={`${row.startuper.fullName} (${row.startuper.email})`}>
          <Link
            to={`/admin/users/${row.startuper.id}`}
            onClick={(e) => e.stopPropagation()}
            className="text-blue-400"
          >
            {row.startuper.fullName} ({row.startuper.email})
          </Link>
        </Clamp>
      ),
      width: 200,
    },
  ];
  return (
    <div className="m-4">
      <div className="mb-4 flex items-center gap-4">
        <h1 className="text-xl">
          Startups{" "}
          <span className="text-sm">
            ({data.from}-{data.to} out of {data.totalStartups})
          </span>
        </h1>
        <label className="flex items-center gap-2 ml-auto">
          Status
          <Select
            options={startupStatusNames}
            clearable
            defaultValue={searchParams.get("status") ?? undefined}
            onChange={(value) => {
              if (!value) {
                searchParams.delete("status");
              } else {
                searchParams.set("status", value);
              }
              searchParams.delete("page");
              setSearchParams(searchParams);
            }}
            className="min-w-[200px]"
          />
        </label>
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
          <Link to="/admin/startups" className="text-blue-300">
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
