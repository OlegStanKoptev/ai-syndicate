import type { ReactNode } from "react";
import { twMerge } from "tailwind-merge";
import Clamp from "./Clamp";

interface InputWrapperProps {
  required?: boolean;
  label?: string;
  error?: string;
  labelAs?: "label" | "div";
  children: ReactNode;
  className?: string;
}

const InputWrapper = ({
  required,
  label,
  error,
  labelAs = "label",
  children,
  className,
}: InputWrapperProps) => {
  const labelContent = (
    <>
      <Clamp title={label} clamp={1} className="ml-1 mb-1 text-gray-700">
        {label}
        {required && <span className="text-red-500"> *</span>}
      </Clamp>
      <div>{children}</div>
    </>
  );
  const labelElement = {
    label: <label className="flex flex-col">{labelContent}</label>,
    div: <div className="flex flex-col">{labelContent}</div>,
  }[labelAs];
  return (
    <div className={twMerge("relative h-fit", className)}>
      {label ? labelElement : children}
      <span
        title={error}
        className="absolute -bottom-4 left-[3px] right-1 overflow-hidden text-ellipsis whitespace-nowrap text-xs text-red-500"
      >
        {error}
      </span>
    </div>
  );
};

export default InputWrapper;
