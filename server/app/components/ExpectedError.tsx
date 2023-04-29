import type { ReactNode } from "react";
import { twMerge } from "tailwind-merge";

interface ExpectedErrorProps {
  children: ReactNode;
  className?: string;
}

export default function ExpectedError({
  children,
  className,
}: ExpectedErrorProps) {
  return (
    <div className={twMerge("bg-red-400 p-4 text-base text-white", className)}>
      {children}
    </div>
  );
}
