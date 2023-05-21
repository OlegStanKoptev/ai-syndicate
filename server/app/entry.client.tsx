import { RemixBrowser } from "@remix-run/react";
import { startTransition, StrictMode } from "react";
// import { hydrateRoot, } from "react-dom/client";
import { hydrate as hydrateRoot } from "react-dom";

function hydrate() {
  startTransition(() => {
    hydrateRoot(
      <StrictMode>
        <RemixBrowser />
      </StrictMode>,
      document
    );
  });
}

if (typeof requestIdleCallback === "function") {
  requestIdleCallback(hydrate);
} else {
  // Safari doesn't support requestIdleCallback
  // https://caniuse.com/requestidlecallback
  setTimeout(hydrate, 1);
}
