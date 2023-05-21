import { twMerge } from "tailwind-merge";

export default function ProgressBar({
  progress,
  label = `${progress}%`,
  className,
  barClassName,
  labelClassName,
}: {
  progress: number;
  label?: string | number;
  className?: string;
  barClassName?: string;
  labelClassName?: string;
}) {
  return (
    <div className={twMerge("bg-gray-200 h-5 rounded-md", className)}>
      <div
        className={twMerge(
          "bg-blue-400 h-full rounded-md flex items-center",
          barClassName
        )}
        style={{ width: `${Math.trunc(progress)}%` }}
      >
        <div
          className={twMerge(
            "ml-auto px-2 text-white font-bold",
            labelClassName
          )}
        >
          {label}
        </div>
      </div>
    </div>
  );
}
