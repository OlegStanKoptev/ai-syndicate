import type { ReactNode } from "react";

interface ColProps {
  children: ReactNode;
}

export default function Col({ children }: ColProps) {
  return <div className="flex-grow basis-0">{children}</div>;
}
