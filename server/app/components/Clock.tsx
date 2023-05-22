import { useEffect, useState } from "react";
import * as dateFns from "date-fns";
import { formatDate } from "~/utils";

export function useClock({
  additionalSeconds = 0,
}: {
  additionalSeconds?: number;
} = {}) {
  const [time, setTime] = useState(new Date());
  useEffect(() => {
    const interval = setInterval(() => setTime(new Date()), 1000);
    return () => {
      clearInterval(interval);
    };
  }, []);
  return dateFns.addSeconds(time, additionalSeconds);
}

export default function Clock({
  additionalSeconds = 0,
  className,
}: {
  additionalSeconds?: number;
  className?: string;
} = {}) {
  const time = useClock({ additionalSeconds });
  return <div className={className}>{formatDate(time, { time: true })}</div>;
}
