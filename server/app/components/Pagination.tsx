import { Link, useSearchParams } from "@remix-run/react";
import { twMerge } from "tailwind-merge";
import Spinner from "./Spinner";

export default function Pagination({
  total,
  size = 10,
  sizeChanging,
  onSizeChange,
  className,
}: {
  total: number;
  size?: number;
  sizeChanging?: { size: number; showSpinner?: boolean };
  onSizeChange?: (size: number) => void;
  className?: string;
}) {
  const [searchParams] = useSearchParams();
  const page = Number(searchParams.get("page")) || 0;
  const allPages = Array.from({ length: total }, (_, i) => i);
  const firstPages = allPages.filter((p) => p < 2);
  const nearbyPages = allPages.filter(
    (p) =>
      ((page >= p && page - p <= 1) || (page <= p && p - page <= 2)) &&
      !firstPages.includes(p)
  );
  const lastPages = allPages.filter(
    (p) => p >= total - 1 && !firstPages.includes(p) && !nearbyPages.includes(p)
  );
  const renderPages = (pages: number[]) => (
    <>
      {pages.map((p) => (
        <Link
          key={p}
          to={`?${makePageSearchParams(p, searchParams)}`}
          className={twMerge(p === page && "text-blue-400")}
        >
          {p + 1}
        </Link>
      ))}
    </>
  );
  return (
    <div className={twMerge("flex items-center gap-4", className)}>
      <div className="flex items-center gap-3 font-bold">
        {page > 0 ? (
          <Link to={`?${makePageSearchParams(page - 1, searchParams)}`}>
            {"<"}
          </Link>
        ) : (
          <span className="text-gray-400">{"<"}</span>
        )}
        {renderPages(firstPages)}
        {firstPages.length > 0 &&
          nearbyPages.length > 0 &&
          firstPages[firstPages.length - 1] + 1 !== nearbyPages[0] && (
            <span className="self-end">. . .</span>
          )}
        {renderPages(nearbyPages)}
        {nearbyPages.length > 0 &&
          lastPages.length > 0 &&
          nearbyPages[nearbyPages.length - 1] + 1 !== lastPages[0] && (
            <span className="self-end">. . .</span>
          )}
        {renderPages(lastPages)}
        {page + 1 < total ? (
          <Link to={`?${makePageSearchParams(page + 1, searchParams)}`}>
            {">"}
          </Link>
        ) : (
          <span className="text-gray-400">{">"}</span>
        )}
      </div>
      <label>
        Show{" "}
        <select
          name="size"
          value={sizeChanging ? sizeChanging.size : size}
          onChange={
            onSizeChange
              ? (e) => onSizeChange(Number(e.target.value))
              : undefined
          }
          className="rounded outline outline-2 outline-gray-700"
        >
          {![10, 20, 50].includes(size) && <option value={size}>{size}</option>}
          <option value="10">10</option>
          <option value="20">20</option>
          <option value="50">50</option>
        </select>
      </label>
      {sizeChanging && (sizeChanging.showSpinner ?? true) && (
        <Spinner className="h-4 w-4" />
      )}
    </div>
  );
}

function makePageSearchParams(page: number, searchParams: URLSearchParams) {
  const pageSearchParams = new URLSearchParams(searchParams);
  if (page === 0) {
    pageSearchParams.delete("page");
  } else {
    pageSearchParams.set("page", String(page));
  }
  return pageSearchParams.toString();
}
