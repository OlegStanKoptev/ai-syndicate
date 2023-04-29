import type { ReactNode } from "react";
import { twMerge } from "tailwind-merge";

interface UnexpectedErrorProps {
  error: Error;
  tryAgainElement?: ReactNode;
  className?: string;
}

export default function UnexpectedError({
  error,
  tryAgainElement,
  className,
}: UnexpectedErrorProps) {
  return (
    <div
      className={twMerge(
        "w-full overflow-auto bg-red-400 p-4 text-white",
        className
      )}
    >
      <h1 className="text-xl font-bold">
        Unexpected error: {error.message}! {tryAgainElement}
      </h1>
      <pre className="mt-8">{error.stack}</pre>
    </div>
  );
}
