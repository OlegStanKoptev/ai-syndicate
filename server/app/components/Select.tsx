import { forwardRef, useState } from "react";
import ReactSelect from "react-select";
import type { ForwardRefRenderFunction } from "react";

interface SelectProps {
  name?: string;
  options?: { [key: string]: string };
  value?: string;
  defaultValue?: string;
  onChange?: (value: string) => void;
  onBlur?: React.FocusEventHandler<HTMLInputElement>;
  disabled?: boolean;
  clearable?: boolean;
  className?: string;
}

const Select: ForwardRefRenderFunction<any, SelectProps> = (
  {
    name,
    options = {},
    value: valueFromProps,
    defaultValue,
    onChange,
    onBlur,
    disabled,
    clearable,
    className,
  },
  ref
) => {
  const isControlled = typeof valueFromProps !== "undefined";
  const hasDefaultValue = typeof defaultValue !== "undefined";
  const [internalValue, setInternalValue] = useState(
    hasDefaultValue ? defaultValue : ""
  );
  const value = isControlled ? valueFromProps : internalValue;
  return (
    <>
      <input type="hidden" name={name} value={value} />
      <ReactSelect
        ref={ref}
        defaultValue={
          defaultValue
            ? { label: options[defaultValue], value: defaultValue }
            : null
        }
        value={value ? { label: options[value], value: value } : null}
        onChange={(o) => {
          if (onChange) {
            onChange(o ? o.value : "");
          }
          if (!isControlled) {
            setInternalValue(o ? o.value : "");
          }
        }}
        onBlur={onBlur}
        options={Object.entries(options).map(([optionValue, label]) => ({
          label,
          value: optionValue,
        }))}
        placeholder={disabled ? "" : "Choose"}
        id="long-value-select"
        instanceId="long-value-select" // This is why: https://github.com/trezor/trezor-suite/issues/290#issuecomment-874685255
        isDisabled={disabled}
        isClearable={clearable}
        styles={{
          option: (styles, { isSelected }) => ({
            ...styles,
            backgroundColor: isSelected ? "var(--blue-400)" : undefined,
            "&:hover": {
              backgroundColor: isSelected ? undefined : "var(--slate-300)",
            },
          }),
          control: (styles, { isFocused }) => ({
            ...styles,
            boxShadow: "none",
            border: "1px solid var(--gray-300)",
            "&:hover": {
              border: isFocused ? undefined : "1px solid var(--gray-400)",
            },
            outline: isFocused ? "2px solid var(--blue-400)" : undefined,
            // backgroundColor: disabled ? "var(--slate-300)" : "var(--slate-200)",
          }),
          input: (styles) => ({
            ...styles,
            "& input": {
              cursor: "inherit",
            },
          }),
        }}
        className={className}
      />
    </>
  );
};

export default forwardRef(Select);
