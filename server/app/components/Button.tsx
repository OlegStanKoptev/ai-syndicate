import type { ForwardRefRenderFunction } from "react";
import { forwardRef } from "react";
import { twMerge } from "tailwind-merge";
import { Spinner } from ".";

interface ButtonProps
  extends React.DetailedHTMLProps<
    React.ButtonHTMLAttributes<HTMLButtonElement>,
    HTMLButtonElement
  > {
  variant?: "filled" | "light";
  size?: "sm" | "md" | "lg";
  loading?: boolean;
}

const Button: ForwardRefRenderFunction<HTMLButtonElement, ButtonProps> = (
  {
    type = "button",
    variant = "filled",
    size = "md",
    loading = false,
    className,
    children,
    ...props
  },
  ref
) => {
  return (
    <button
      ref={ref}
      type={type}
      className={twMerge(
        getButtonClassName({ variant, size }),
        "relative",
        "disabled:brightness-75",
        className
      )}
      {...props}
    >
      {loading && (
        <Spinner
          className={twMerge(
            "absolute top-0 right-0 bottom-0 left-0 m-auto text-inherit",
            size === "sm" && "h-4 w-4",
            size === "md" && "h-5 w-5",
            size === "lg" && "h-6 w-6"
          )}
        />
      )}
      <div className={twMerge(loading && "invisible")}>{children}</div>
    </button>
  );
};

export function getButtonClassName({
  variant,
  size,
}: {
  variant: ButtonProps["variant"];
  size: ButtonProps["size"];
}) {
  return twMerge(
    "rounded font-bold h-fit flex items-center justify-center",
    variant === "filled" && "bg-blue-400 text-white hover:bg-blue-500",
    variant === "light" && "bg-white text-blue-500 hover:bg-slate-100",
    size === "sm" && "py-1 px-3 text-sm",
    size === "md" && "text-base py-2 px-4",
    size === "lg" && "py-3 px-5 text-lg"
  );
}

export default forwardRef(Button);
