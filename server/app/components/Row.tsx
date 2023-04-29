import type { ReactNode } from "react";

interface RowProps {
  children: ReactNode;
}

export default function Row({ children }: RowProps) {
  return <div className="flex justify-between gap-4">{children}</div>;
}
