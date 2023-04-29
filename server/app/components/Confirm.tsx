import type { ReactNode } from "react";
import { useContext } from "react";
import { createContext, useState } from "react";
import Button from "./Button";

const ConfirmContext = createContext<
  { confirm: (message: ReactNode) => Promise<boolean> } | undefined
>(undefined);

let resolve: (success: boolean) => void;

interface ConfirmProviderProps {
  children: ReactNode;
}

export function ConfirmProvider({ children }: ConfirmProviderProps) {
  const [isOpen, setIsOpen] = useState(false);
  const [message, setMessage] = useState<ReactNode>(null);
  const confirm = async (mes: ReactNode) => {
    setIsOpen(true);
    setMessage(mes);
    return new Promise<boolean>((res) => {
      resolve = res;
    });
  };
  return (
    <ConfirmContext.Provider value={{ confirm }}>
      {children}
      {isOpen && (
        <div className="fixed top-0 right-0 bottom-0 left-0 bg-slate-500/50">
          <div className="grid h-full items-center justify-center">
            <div className="max-w-sm rounded bg-white p-5 shadow-lg">
              {message}
              <div className="mt-8 flex gap-4">
                <Button
                  size="sm"
                  onClick={() => {
                    setIsOpen(false);
                    setMessage(null);
                    resolve(true);
                  }}
                >
                  Yes
                </Button>
                <Button
                  size="sm"
                  onClick={() => {
                    setIsOpen(false);
                    setMessage(null);
                    resolve(false);
                  }}
                >
                  Cancel
                </Button>
              </div>
            </div>
          </div>
        </div>
      )}
    </ConfirmContext.Provider>
  );
}

export function useConfirm() {
  const context = useContext(ConfirmContext);
  if (context === undefined) {
    throw new Error(
      "useConfirm can only be used inside ConfirmContextProvider"
    );
  }
  const { confirm } = context;
  return confirm;
}
