import type { ReactNode } from "react";
import {
  TiArrowSortedDown,
  TiArrowSortedUp,
  TiArrowUnsorted,
} from "react-icons/ti";
import { twMerge } from "tailwind-merge";
import type { OrderBy } from "~/utils";
import Clamp from "./Clamp";
import Spinner from "./Spinner";

export const defaultColumnWidth = 150;

type Cell<TData> = ({ row }: { row: TData }) => ReactNode;
type OnSort = ({
  colId,
  orderBy,
}: {
  colId: string;
  orderBy: OrderBy | null;
}) => void;

export interface TableColumn<
  TData extends { id: string },
  TColumn extends string
> {
  id: TColumn;
  header?: ReactNode;
  cell?: Cell<TData>;
  width?: number;
  sortable?: boolean;
}

interface TableProps<TData extends { id: string }, TColumn extends string> {
  data: TData[];
  columns: TableColumn<TData, TColumn>[];
  onRowClick?: ({ row }: { row: TData }) => void;
  sort?: {
    by?: {
      colId: TColumn;
      orderBy: OrderBy;
    };
    sorting?: {
      colId: string;
      orderBy: OrderBy | null;
      showSpinner?: boolean;
    };
    onSort?: OnSort;
  };
  noDataFallback?: ReactNode;
  className?: string;
}

export default function Table<
  TData extends { id: string },
  TColumn extends string
>({
  data,
  columns,
  onRowClick,
  sort,
  noDataFallback,
  className,
}: TableProps<TData, TColumn>) {
  return (
    <>
      <table className={twMerge("block w-fit border-t border-l", className)}>
        <thead className="block">
          <tr className="flex">
            {columns.map(({ id, header, width, sortable }) => (
              <TableHeader
                key={id}
                colId={id}
                width={width}
                sort={(() => {
                  if (!sortable || !sort) {
                    return undefined;
                  }
                  const sortBy = sort.sorting ?? sort.by;
                  return {
                    orderBy:
                      sortBy && sortBy.colId === id ? sortBy.orderBy : null,
                    isSorting:
                      sort.sorting &&
                      sort.sorting.colId === id &&
                      (sort.sorting.showSpinner ?? true),
                    onSort: sort.onSort,
                  };
                })()}
              >
                {header}
              </TableHeader>
            ))}
          </tr>
        </thead>
        <tbody className="block">
          {data.map((row) => (
            <tr
              key={row.id}
              onClick={onRowClick ? () => onRowClick({ row }) : undefined}
              className="flex hover:bg-blue-100"
            >
              {columns.map(({ id, cell, width = defaultColumnWidth }) => {
                return (
                  <td
                    key={id}
                    className="flex shrink-0 items-center justify-center border-b border-r p-2"
                    style={{ width }}
                  >
                    {cell ? (
                      (() => {
                        const element: ReactNode = cell({ row });
                        if (
                          typeof element === "string" ||
                          typeof element === "number"
                        ) {
                          return (
                            <Clamp className="h-10 text-center">
                              {element}
                            </Clamp>
                          );
                        }
                        return (
                          <div className="flex h-10 items-center text-center">
                            {element}
                          </div>
                        );
                      })()
                    ) : (
                      <Clamp className="h-10 text-center">
                        {row[id as keyof TData] as ReactNode}
                      </Clamp>
                    )}
                  </td>
                );
              })}
            </tr>
          ))}
        </tbody>
      </table>
      {data.length === 0 && (
        <div
          className="block border-x border-b py-4 px-3 italic"
          style={{
            width:
              columns.reduce(
                (acc, col) => acc + (col.width ?? defaultColumnWidth),
                0
              ) + 1,
          }}
        >
          {noDataFallback ?? "No data"}
        </div>
      )}
    </>
  );
}

function TableHeader<Column extends string>({
  colId,
  width = defaultColumnWidth,
  sort,
  children,
}: {
  colId: Column;
  width?: number;
  sort?: {
    orderBy: OrderBy | null;
    isSorting?: boolean;
    onSort?: OnSort;
  };
  children?: ReactNode;
}) {
  return (
    <th
      className="flex shrink-0 items-center justify-center border-b border-r p-2"
      style={{ width }}
    >
      <button
        onClick={
          sort && sort.onSort
            ? () =>
                sort.onSort!({
                  colId,
                  orderBy: sort.orderBy
                    ? sort.orderBy === "asc"
                      ? "desc"
                      : null
                    : "asc",
                })
            : undefined
        }
        className={twMerge(
          "flex grow items-center justify-center outline-none",
          !sort && "cursor-default"
        )}
      >
        {typeof children === "string" ? (
          <Clamp className="h-10">{children}</Clamp>
        ) : (
          children
        )}
        {sort && (
          <div className="relative">
            {sort.orderBy ? (
              sort.orderBy === "desc" ? (
                <TiArrowSortedUp
                  title="No order"
                  className="h-4 w-4 shrink-0"
                />
              ) : (
                <TiArrowSortedDown
                  title="Descending order"
                  className="h-4 w-4 shrink-0"
                />
              )
            ) : (
              <TiArrowUnsorted
                title="Ascending order"
                className="h-4 w-4 shrink-0"
              />
            )}
            {sort.isSorting && (
              <Spinner className="absolute left-0 top-0 h-4 w-4" />
            )}
          </div>
        )}
      </button>
    </th>
  );
}
