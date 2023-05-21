import type { ForwardRefRenderFunction } from "react";
import { forwardRef } from "react";
import { twMerge } from "tailwind-merge";

interface SelectProps
  extends React.DetailedHTMLProps<
    React.InputHTMLAttributes<HTMLSelectElement>,
    HTMLSelectElement
  > {
  options: { [key: string]: string };
  emptyOptionName?: string;
}

const Select: ForwardRefRenderFunction<HTMLSelectElement, SelectProps> = (
  { name, className, options, emptyOptionName = "None", ...props },
  ref
) => {
  return (
    <select
      ref={ref}
      name={name}
      className={twMerge(
        "rounded border border-gray-300 py-2 pl-3 hover:border-gray-400 hover:outline-gray-900 focus:outline-blue-400",
        className
      )}
      {...props}
    >
      <option key="" value="">
        {emptyOptionName}
      </option>
      {Object.entries(options).map(([value, label]) => (
        <option key={value} value={value}>
          {label}
        </option>
      ))}
    </select>
  );
};

export default forwardRef(Select);
