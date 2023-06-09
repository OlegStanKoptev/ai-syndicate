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
  applicationNewDeveloperStatuses,
  applicationNewDeveloperStatusNames,
  usePaginationSize,
  useSort,
} from "~/utils";
import type { OrderBy } from "~/utils";
import type { ApplicationNewDeveloper } from "@prisma/client";
import { z } from "zod";

const { columns, sortKeys, prepareColumn } = prepareTable({
  columns: ["id", "status", "orgName", "email", "inn"],
  sortKeys: ["status", "orgName"],
});

type SortableColumnKey = (typeof sortKeys)[number];

type LoaderData = {
  applicationsNewDeveloper: ApplicationNewDeveloper[];
  from: number;
  to: number;
  totalApplicationsNewDeveloper: number;
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
    schema: z.enum(applicationNewDeveloperStatuses).optional(),
    throw_: new Response(
      `Parameter status is incorrect: ${searchParams.get("status")}`,
      { status: 400 }
    ),
  });
  const where = { status };
  const totalApplicationsNewDeveloper = await db.applicationNewDeveloper.count({
    where,
  });
  const totalPages = Math.ceil(totalApplicationsNewDeveloper / size);
  if (totalApplicationsNewDeveloper > 0 && page + 1 > totalPages) {
    throw new Response(`Parameter page is incorrect: ${page}`, {
      status: 400,
    });
  }
  const applicationsNewDeveloper = await db.applicationNewDeveloper.findMany({
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
  const from = Math.min(totalApplicationsNewDeveloper, size * page + 1);
  const to = Math.min(totalApplicationsNewDeveloper, size * (page + 1));
  return new Response(
    serialize<LoaderData>({
      applicationsNewDeveloper,
      from,
      to,
      totalApplicationsNewDeveloper,
      totalPages,
      size,
      sort: sortKey ? { column: sortKey, orderBy } : undefined,
    })
  );
};

export const meta: MetaFunction = () => {
  return {
    title: "AI Syndicate (admin) | New Developer Applications",
  };
};

type TableColumnKey = (typeof columns)[number];
type TableRowData = LoaderData["applicationsNewDeveloper"][number];

export default function ApplicationsNewDeveloperIndex() {
  const data = deserialize<LoaderData>(useLoaderData());
  const navigate = useNavigate();
  const [searchParams, setSearchParams] = useSearchParams();
  const sort = useSort({ sort: data.sort });
  const { sizeChanging, onSizeChange } = usePaginationSize();
  const { applicationsNewDeveloper: tableData } = data;
  const tableColumns: TableColumn<TableRowData, TableColumnKey>[] = [
    { ...prepareColumn("id"), header: "Id", width: 250 },
    {
      ...prepareColumn("status"),
      header: "Status",
      cell: ({ row }) => applicationNewDeveloperStatusNames[row.status],
      width: 170,
    },
    {
      ...prepareColumn("orgName"),
      header: "Org Name",
      width: 200,
    },
    { ...prepareColumn("email"), header: "Email", width: 200 },
    {
      ...prepareColumn("inn"),
      header: "INN",
      width: 200,
    },
  ];
  return (
    <div className="m-4">
      <div className="mb-4 flex items-center gap-4">
        <h1 className="text-xl">
          ApplicationsNewDeveloper{" "}
          <span className="text-sm">
            ({data.from}-{data.to} out of {data.totalApplicationsNewDeveloper})
          </span>
        </h1>
        <Select
          options={applicationNewDeveloperStatusNames}
          defaultValue={searchParams.get("status") ?? undefined}
          emptyOptionName="All"
          onChange={(e) => {
            if (!e.target.value) {
              searchParams.delete("status");
            } else {
              searchParams.set("status", e.target.value);
            }
            searchParams.delete("page");
            setSearchParams(searchParams);
          }}
        />
      </div>
      <div className="max-w-full overflow-auto">
        <Table
          data={tableData}
          columns={tableColumns}
          onRowClick={({ row }) => navigate(row.id)}
          sort={sort}
          noDataFallback="No results"
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
          <Link to="/admin/applicationsNewDeveloper" className="text-blue-300">
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
