import type { LinkProps } from "@remix-run/react";
import { Link } from "@remix-run/react";
import { twMerge } from "tailwind-merge";
import { getButtonClassName } from "./Button";

interface LinkButtonProps extends LinkProps {
  variant?: "filled" | "light";
  size?: "sm" | "md" | "lg";
}

const LinkButton = ({
  variant = "filled",
  size = "md",
  className,
  children,
  ...props
}: LinkButtonProps) => {
  return (
    <Link
      className={twMerge(
        getButtonClassName({ variant, size }),
        "inline-block",
        className
      )}
      {...props}
    >
      {children}
    </Link>
  );
};

export default LinkButton;
