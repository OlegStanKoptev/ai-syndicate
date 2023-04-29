import type { ReactNode } from "react";
import { twMerge } from "tailwind-merge";

interface ClampProps {
  clamp?: number;
  title?: string;
  className?: string;
  children?: ReactNode;
}

export default function Clamp({
  clamp = 2,
  title,
  className,
  children,
}: ClampProps) {
  return (
    <div className={twMerge("flex items-center", className)}>
      <div
        title={
          title ??
          (typeof children === "string"
            ? children
            : typeof children === "number"
            ? String(children)
            : undefined)
        }
        className="overflow-hidden overflow-ellipsis"
        style={{
          display: "-webkit-box",
          WebkitBoxOrient: "vertical",
          WebkitLineClamp: String(clamp),
          overflowWrap: "anywhere",
        }}
      >
        {children}
      </div>
    </div>
  );
}
