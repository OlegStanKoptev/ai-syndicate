import type { ForwardRefRenderFunction } from "react";
import { forwardRef } from "react";
import { twMerge } from "tailwind-merge";

interface TextInputProps
  extends React.DetailedHTMLProps<
    React.InputHTMLAttributes<HTMLInputElement>,
    HTMLInputElement
  > {}

const TextInput: ForwardRefRenderFunction<HTMLInputElement, TextInputProps> = (
  { name, className, ...props },
  ref
) => {
  return (
    <input
      ref={ref}
      name={name}
      className={twMerge(
        "w-full rounded border border-gray-300 py-2 px-3 hover:border-gray-400 hover:outline-gray-900 focus:outline-blue-400",
        className
      )}
      {...props}
    />
  );
};

export default forwardRef(TextInput);
