import type { ForwardRefRenderFunction } from "react";
import { forwardRef } from "react";
import { twMerge } from "tailwind-merge";

interface TextareaProps
  extends React.DetailedHTMLProps<
    React.InputHTMLAttributes<HTMLTextAreaElement>,
    HTMLTextAreaElement
  > {}

const Textarea: ForwardRefRenderFunction<HTMLTextAreaElement, TextareaProps> = (
  { name, className, ...props },
  ref
) => {
  return (
    <textarea
      ref={ref}
      name={name}
      className={twMerge(
        "h-28 min-h-[38px] w-full rounded border border-gray-300 py-2 px-3 hover:border-gray-400 focus:outline-blue-400",
        className
      )}
      {...props}
    />
  );
};

export default forwardRef(Textarea);
