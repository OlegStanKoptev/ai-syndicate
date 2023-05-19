import type { LinksFunction, MetaFunction } from "@remix-run/node";
import {
  Link,
  Links,
  LiveReload,
  Meta,
  Outlet,
  Scripts,
  ScrollRestoration,
  useCatch,
  useLocation,
} from "@remix-run/react";
import stylesheet from "~/tailwind.css";
import { ConfirmProvider, ExpectedError, UnexpectedError } from "./components";

export const links: LinksFunction = () => [
  { rel: "stylesheet", href: stylesheet },
];

export const meta: MetaFunction = () => ({
  charset: "utf-8",
  title: "AI Syndicate (admin)",
  viewport: "width=device-width,initial-scale=1",
});

export default function App() {
  return (
    <html lang="en">
      <head>
        <Meta />
        <Links />
      </head>
      <body className="h-screen bg-white text-sm text-gray-600">
        <ConfirmProvider>
          <Outlet />
        </ConfirmProvider>
        <ScrollRestoration />
        <Scripts />
        <LiveReload />
      </body>
    </html>
  );
}

export function ErrorBoundary({ error }: { error: Error }) {
  console.error(error);
  return (
    <html>
      <head>
        <title>Unexpected error!</title>
        <Meta />
        <Links />
      </head>
      <body>
        <main>
          <UnexpectedError error={error} className="mt-4" />
        </main>
        <Scripts />
      </body>
    </html>
  );
}

export function CatchBoundary() {
  const caught = useCatch();
  const location = useLocation();
  switch (caught.status) {
    case 404: {
      return (
        <html>
          <head>
            <title>Oops!</title>
            <Meta />
            <Links />
          </head>
          <body>
            <ExpectedError className="mt-4 w-full">
              <p>Страница не найдена: {location.pathname}</p>
              <Link to="/admin" className="text-blue-300">
                Перейти на главную
              </Link>
            </ExpectedError>
            <Scripts />
          </body>
        </html>
      );
    }
    default: {
      return ErrorBoundary({
        error: new Error(`Unhandled error: ${caught.status}`),
      });
    }
  }
}
