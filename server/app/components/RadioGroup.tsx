import type { ForwardRefRenderFunction } from "react";
import { useState } from "react";
import { forwardRef } from "react";
import { twMerge } from "tailwind-merge";

interface RadioGroupProps {
  name?: string;
  options?: { [key: string]: string };
  value?: string | null;
  defaultValue?: string;
  onChange?: React.ChangeEventHandler<HTMLInputElement>;
  className?: string;
}

const RadioGroup: ForwardRefRenderFunction<
  HTMLInputElement,
  RadioGroupProps
> = (
  {
    name,
    options = {},
    value: valueFromProps,
    defaultValue,
    onChange,
    className,
  },
  ref
) => {
  const isControlled = typeof valueFromProps !== "undefined";
  const hasDefaultValue = typeof defaultValue !== "undefined";
  const [internalValue, setInternalValue] = useState(
    hasDefaultValue ? defaultValue : null
  );
  const value = isControlled ? valueFromProps : internalValue;
  return (
    <div className={twMerge("flex gap-4 flex-wrap", className)}>
      {/* NOTE: i pass this ref to an invisible input so that */}
      {/* react-hook-form focuses it on validation error*/}
      <input ref={ref} className="absolute h-0 w-0" />
      {Object.entries(options).map(([radioValue, label]) => (
        <div key={radioValue}>
          <input
            type="radio"
            id={radioValue}
            name={name}
            value={radioValue}
            checked={value !== undefined ? value === radioValue : undefined}
            onChange={(e) => {
              if (onChange) {
                onChange(e);
              }
              if (!isControlled) {
                setInternalValue(e.target.value);
              }
            }}
            className="peer hidden"
          />
          <label
            htmlFor={radioValue}
            className="block rounded border border-gray-300 px-3 py-2 outline-2 outline-offset-[-2px] outline-blue-400 hover:border-gray-400 peer-checked:border-transparent peer-checked:outline text-center"
          >
            {label}
          </label>
        </div>
      ))}
    </div>
  );
};

export default forwardRef(RadioGroup);
