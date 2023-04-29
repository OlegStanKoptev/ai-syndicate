import type { ForwardRefRenderFunction } from "react";
import { useImperativeHandle, useRef, useState } from "react";
import ReactDatePicker from "react-datepicker";
import { forwardRef } from "react";
import { twMerge } from "tailwind-merge";
import { createPortal } from "react-dom";

interface DatePickerProps {
  name?: string;
  value?: Date | null;
  defaultValue?: Date | null;
  onChange?: (value: Date | null) => void;
  disabled?: boolean;
  className?: string;
}

const DatePicker: ForwardRefRenderFunction<any, DatePickerProps> = (
  { name, value: valueFromProps, defaultValue, onChange, disabled, className },
  ref
) => {
  const isControlled = typeof valueFromProps !== "undefined";
  const hasDefaultValue = typeof defaultValue !== "undefined";
  const [internalValue, setInternalValue] = useState(
    hasDefaultValue ? defaultValue : null
  );
  const value = isControlled ? valueFromProps : internalValue;
  const inputRef = useRef<any>();
  useImperativeHandle(ref, () => inputRef.current?.input);
  return (
    <>
      <input
        type="hidden"
        name={name}
        value={
          value === null ? "" : value === undefined ? undefined : String(value)
        }
        defaultValue={
          defaultValue === null
            ? ""
            : defaultValue === undefined
            ? undefined
            : String(defaultValue)
        }
      />
      <ReactDatePicker
        ref={inputRef}
        selected={value}
        onChange={(value) => {
          if (onChange) {
            onChange(value);
          }
          if (!isControlled) {
            setInternalValue(value);
          }
          setTimeout(() => inputRef.current?.input.focus());
        }}
        onBlur={() => inputRef.current?.handleCalendarClickOutside()}
        autoComplete="off"
        disabled={disabled}
        showMonthDropdown
        showYearDropdown
        dropdownMode="select"
        preventOpenOnFocus
        dateFormat="dd.MM.yyyy"
        placeholderText="dd.mm.yyyy"
        popperContainer={
          typeof document !== "undefined"
            ? ({ children }) => createPortal(children, document.body)
            : undefined
        }
        className={twMerge(
          "w-full rounded border border-gray-300 py-2 px-3 hover:border-gray-400 hover:outline-gray-900 focus:outline-blue-400",
          className
        )}
      />
    </>
  );
};

export default forwardRef(DatePicker);
