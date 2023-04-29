import type { ForwardRefRenderFunction } from "react";
import { forwardRef } from "react";
import { HiCheck } from "react-icons/hi";
import { twMerge } from "tailwind-merge";

interface CheckboxProps
  extends React.DetailedHTMLProps<
    React.InputHTMLAttributes<HTMLInputElement>,
    HTMLInputElement
  > {
  label?: string;
}

const Checkbox: ForwardRefRenderFunction<HTMLInputElement, CheckboxProps> = (
  { type, label, className, ...props },
  ref
) => {
  return (
    <label
      className={twMerge(
        "relative flex w-min items-center whitespace-nowrap",
        className
      )}
    >
      <input
        ref={ref}
        type="checkbox"
        className="peer h-5 w-5 appearance-none rounded border border-gray-400 text-white checked:bg-blue-400"
        {...props}
      />
      <div className="invisible absolute flex h-5 w-5 items-center justify-center peer-checked:visible">
        <HiCheck className="h-5 w-5 fill-white" />
      </div>
      <span className="ml-3">{label}</span>
    </label>
  );
};

export default forwardRef(Checkbox);
