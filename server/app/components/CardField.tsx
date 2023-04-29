import type { ReactNode } from "react";
import { twMerge } from "tailwind-merge";

interface CardFieldProps {
  name: string;
  children?: ReactNode;
}

export default function CardField({ name, children }: CardFieldProps) {
  return (
    <div
      className={twMerge(
        "mb-3 flex",
        children === null && "italic text-gray-500"
      )}
    >
      <div className="flex basis-1/2 items-end">
        <span>{name}</span>
        <div className="mx-1 mb-1 min-w-[16px] flex-grow border-b border-dotted border-gray-500" />
      </div>
      <span className="basis-1/2 self-end font-bold">
        {children === null ? "-" : children}
      </span>
    </div>
  );
}
