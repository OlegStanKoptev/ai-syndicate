import type { User } from "@prisma/client";
import type { LoaderFunction } from "@remix-run/node";
import {
  Form,
  Link,
  NavLink,
  Outlet,
  useLoaderData,
  useLocation,
  useMatches,
  useTransition,
} from "@remix-run/react";
import { useSpinDelay } from "spin-delay";
import { twMerge } from "tailwind-merge";
import invariant from "tiny-invariant";
import { Button, Nav, Spinner } from "~/components";
import logoImgUrl from "~/images/logo.svg";
import { deserialize, serialize } from "~/utils";
import { getCurrentAdmin } from "~/utils.server";

type LoaderData = {
  admin: User | null;
};

export const loader: LoaderFunction = async ({ request }) => {
  const admin = await getCurrentAdmin(request);
  return serialize<LoaderData>({ admin });
};

export default function Private() {
  const data = deserialize<LoaderData>(useLoaderData());
  const location = useLocation();
  const transition = useTransition();
  const isLoadingPage = useSpinDelay(transition.state === "loading");
  const isExiting = useSpinDelay(
    transition.state === "submitting" &&
      transition.location.pathname === "/logout"
  );
  const matches = useMatches();
  return (
    <div className="flex min-h-full flex-col">
      <header className="fixed z-10 flex h-[40px] w-full items-center justify-between gap-4 bg-white/90 px-6 py-3 shadow-md ">
        <NavLink
          to="/admin"
          end
          className={({ isActive }) => (isActive ? "text-blue-400" : undefined)}
        >
          <div className="flex items-center p-1">
            <img width={24} height={24} src={logoImgUrl} alt="Logo" />
            <h1 className="mx-2 whitespace-nowrap text-base font-bold">
              AI Syndicate | Admin
            </h1>
          </div>
        </NavLink>
        <div className="ml-auto flex items-center gap-4">
          {data.admin ? (
            <>
              {data.admin.email}
              <Form method="post" action="logout">
                <input
                  type="hidden"
                  name="redirectTo"
                  value={location.pathname + location.search}
                />
                <Button type="submit" size="sm" loading={isExiting}>
                  Log out
                </Button>
              </Form>
            </>
          ) : (
            <Link
              to={`login?redirectTo=${location.pathname + location.search}`}
              className="text-blue-400"
            >
              Log in
            </Link>
          )}
        </div>
      </header>
      <div className="h-[40px]" />
      <Nav
        navItems={
          data.admin
            ? [
                {
                  path: "spec",
                  name: "API",
                },
                {
                  path: "newDeveloperApplications",
                  name: "New developer appplications",
                },
                ...(process.env.NODE_ENV === "development"
                  ? [
                      {
                        path: "playground",
                        name: "Playground",
                      },
                    ]
                  : []),
              ]
            : [
                {
                  path: "spec",
                  name: "Specification",
                },
              ]
        }
        className="border-b-2"
      />
      {matches.some((match) => match?.handle?.breadcrumb !== undefined) && (
        <ul className="flex gap-2 border-b-2 py-1 px-4">
          {matches
            .filter((match) => match?.handle?.breadcrumb !== undefined)
            .map((match, i) => {
              invariant(match?.handle?.breadcrumb);
              return (
                <li key={i} className="flex gap-2">
                  <span>/</span>
                  <span
                    className={twMerge(
                      "underline",
                      match.pathname === location.pathname &&
                        "text-gray-900 no-underline"
                    )}
                  >
                    {match.handle.breadcrumb(match)}
                  </span>
                </li>
              );
            })}
        </ul>
      )}
      <main className="flex-grow">
        <Outlet />
      </main>
      <footer className="border-t-2 bg-slate-100 p-3 text-center text-xs">
        AI Syndicate © {new Date().getFullYear()}
      </footer>
      {isLoadingPage && (
        <Spinner className="fixed bottom-4 right-4 h-12 w-12" />
      )}
    </div>
  );
}
