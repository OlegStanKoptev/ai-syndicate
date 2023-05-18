import type {
  ActionFunction,
  LoaderFunction,
  MetaFunction,
} from "@remix-run/node";
import { Link, useFetcher, useLoaderData } from "@remix-run/react";
import { useRef, useState } from "react";
import { twMerge } from "tailwind-merge";
import { InputWrapper } from "~/components";
import { db } from "~/db.server";
import { deserialize, serialize, startupStatuses, useHydrated } from "~/utils";

export const action: ActionFunction = async () => {
  return null;
};

type LoaderData = {
  exampleStartupId: string;
  exampleStartuperId: string;
  exampleVerificationStartupId: string;
};

export const loader: LoaderFunction = async () => {
  const startup = await db.startup.findFirst();
  const startuper = await db.user.findFirst({ where: { role: "user" } });
  const startupVerification = await db.startup.findFirst({
    where: { status: "verification" },
  });
  return serialize<LoaderData>({
    exampleStartupId: startup ? startup.id : "",
    exampleStartuperId: startuper ? startuper.id : "",
    exampleVerificationStartupId: startupVerification
      ? startupVerification.id
      : "",
  });
};

export const handle = {
  breadcrumb: () => <Link to="spec">Specification</Link>,
};

export const meta: MetaFunction = () => {
  return {
    title: "AI Syndicate (admin) | Specification",
  };
};

export default function Spec() {
  const data = deserialize<LoaderData>(useLoaderData());
  return (
    <main className="m-5">
      <h1 className="mt-14 font-bold text-lg">User</h1>
      <Endpoint
        method="post"
        route="/api/user/login"
        examples={[
          {
            name: "As user (startuper@startuper.com)",
            body: { email: "startuper@startuper.com", password: "startuper" },
          },
          {
            name: "As user (investor@investor.com)",
            body: { email: "investor@investor.com", password: "investor" },
          },
          {
            name: "As expert",
            body: { email: "expert@expert.com", password: "expert" },
          },
          {
            name: "As admin",
            body: { email: "admin@admin.com", password: "admin" },
          },
        ]}
      />
      <Endpoint
        method="post"
        route="/api/user/logout"
        examples={[{ name: "Example" }]}
      />
      <Endpoint
        method="get"
        route="/api/user/me"
        examples={[{ name: "Example" }]}
        className="mt-4"
      />
      <Endpoint
        method="post"
        route="/api/user/join"
        examples={[
          {
            name: "Example",
            body: {
              email: "user1337@user1337.com",
              password: "user1337",
              fullName: "User 1337",
              avatarImageFile: null,
            },
          },
        ]}
        className="mt-4"
      />
      <Endpoint
        method="post"
        route="/api/user/deposit"
        examples={[
          {
            name: "Example",
            body: { amount: 50 },
          },
        ]}
      />
      <h1 className="mt-14 font-bold text-lg">Startup</h1>
      <Endpoint
        method="get"
        route="/api/startup/{startupId}"
        examples={[
          { name: "Example", path: { startupId: data.exampleStartupId } },
        ]}
        className="mt-4"
      />
      <Endpoint
        method="post"
        route="/api/startup/new"
        examples={[
          {
            name: "Example",
            body: {
              name: "Startup with AI",
              description: "Please invest",
              logoFile: null,
              specificationFile: "tz4.pdf",
              businessPlanFile: null,
              presentationFile: null,
            },
          },
        ]}
        className="mt-4"
      />
      <Endpoint
        method="get"
        route="/api/startup/search"
        examples={[
          { name: "All" },
          { name: "With pagination", search: { page: 1, size: 10 } },
          {
            name: "With filters",
            comment: `Statuses: ${startupStatuses}`,
            search: { status: "verification" },
          },
          {
            name: "For startupers",
            search: { startuperId: data.exampleStartuperId },
          },
        ]}
        className="mt-4"
      />
      <Endpoint
        method="post"
        route="/api/startup/{startupId}/verification/vote"
        examples={[
          {
            name: "Yea",
            path: { startupId: data.exampleVerificationStartupId },
            body: { yea: true },
          },
          {
            name: "Nay",
            path: { startupId: data.exampleVerificationStartupId },
            body: { yea: false, nayReason: "Bad idea" },
          },
        ]}
        className="mt-4"
      />
      <Endpoint
        method="post"
        route="/api/startup/{startupId}/verification_succeded/confirm"
        examples={[
          {
            name: "Example",
            path: { startupId: "" },
            body: {
              targetFinancing: 100,
              financingDeadline: new Date(2023, 6, 1),
            },
          },
        ]}
        className="mt-4"
      />
      <h1 className="mt-14 font-bold text-lg">Files</h1>
      <Endpoint
        method="post"
        route="/api/file/new"
        examples={[
          {
            name: "Example",
            form: (
              <>
                <InputWrapper label="file">
                  <input type="file" name="file" />
                </InputWrapper>
              </>
            ),
          },
        ]}
        className="mt-4"
      />
    </main>
  );
}

function Endpoint({
  method,
  route,
  examples,
  className,
}: {
  method: "post" | "get";
  route: string;
  examples: [
    {
      name: string;
      comment?: string;
      body?: any;
      form?: any;
      path?: any;
      search?: any;
    },
    ...{
      name: string;
      comment?: string;
      body?: any;
      form?: any;
      path?: any;
      search?: any;
    }[]
  ];
  className?: string;
}) {
  const [firstExample] = examples;
  const [chosenExample, setChosenExample] = useState(firstExample.name);
  return (
    <div className={twMerge("border p-4 border-gray-400", className)}>
      <span className="block font-bold">
        {method.toUpperCase()} {route}
      </span>
      {examples.length > 1 && (
        <div className="flex flex-wrap gap-3 mt-4">
          {examples.map((example) => (
            <button
              key={example.name}
              onClick={() => setChosenExample(example.name)}
              className={twMerge(
                "p-3 border",
                chosenExample === example.name && "border-blue-500"
              )}
            >
              {example.name}
            </button>
          ))}
        </div>
      )}
      {examples.map((example) => (
        <EndpointExample
          key={example.name}
          comment={example.comment}
          method={method}
          route={route}
          body={example.body}
          form={example.form}
          path={example.path}
          search={example.search}
          className={twMerge(chosenExample !== example.name && "hidden")}
        />
      ))}
    </div>
  );
}

function EndpointExample({
  comment,
  method,
  route,
  body: initialBody,
  form,
  path: initialPath,
  search: initialSearch,
  className,
}: {
  comment?: string;
  method: "post" | "get";
  route: string;
  body?: any;
  form?: any;
  path?: any;
  search?: any;
  className?: string;
}) {
  const fetcher = useFetcher();
  const hydrated = useHydrated();
  const formRef = useRef<HTMLFormElement>(null);
  const [body, setBody] = useState(JSON.stringify(initialBody, null, 2));
  const bodyRef = useRef<HTMLElement>(null);
  const [path, setPath] = useState(JSON.stringify(initialPath, null, 2));
  const pathRef = useRef<HTMLElement>(null);
  const [search, setSearch] = useState(JSON.stringify(initialSearch, null, 2));
  const searchRef = useRef<HTMLElement>(null);
  const [response, setResponse] = useState<{ status: number; json: string }>();
  const [loading, setLoading] = useState(false);
  return (
    <form
      ref={formRef}
      onSubmit={async (e) => {
        e.preventDefault();
        const formData = new FormData(e.currentTarget);
        if (hydrated) {
          setLoading(true);
          const pathname = Object.entries(JSON.parse(path ?? "{}")).reduce(
            (acc, [key, value]) =>
              acc.replace(new RegExp(`{${key}}`), value as string),
            route
          );
          const searchParams = new URLSearchParams(JSON.parse(search ?? "{}"));
          const searchString = searchParams.toString()
            ? `?${searchParams.toString()}`
            : "";
          const response = await fetch(
            `${window.location.origin}${pathname}${searchString}`,
            {
              method,
              body: form ? formData : body,
            }
          );
          fetcher.submit(null, { method: "post" });
          try {
            setResponse({
              status: response.status,
              json: JSON.stringify(await response.json(), null, 2),
            });
          } catch {
            setResponse({
              status: response.status,
              json: "Empty response",
            });
          }
          setLoading(false);
        }
      }}
      className={twMerge(className)}
    >
      {comment && <pre className="mt-4">{comment}</pre>}
      {initialBody && (
        <>
          <span className="block mt-4">body:</span>
          <pre>
            <code
              ref={bodyRef}
              contentEditable
              suppressContentEditableWarning
              onInput={(e) => setBody(String(e.currentTarget.textContent))}
              className="p-4 bg-slate-200 block"
            >
              {JSON.stringify(initialBody, null, 2)}
            </code>
          </pre>
        </>
      )}
      {form && (
        <>
          <span className="block mt-4">form data:</span>
          <div className="p-4 bg-slate-200 block">{form}</div>
        </>
      )}
      {initialPath && (
        <>
          <span className="block mt-4">path:</span>
          <pre>
            <code
              ref={pathRef}
              contentEditable
              suppressContentEditableWarning
              onInput={(e) => setPath(String(e.currentTarget.textContent))}
              className="p-4 bg-slate-200 block"
            >
              {JSON.stringify(initialPath, null, 2)}
            </code>
          </pre>
        </>
      )}
      {initialSearch && (
        <>
          <span className="block mt-4">search:</span>
          <pre>
            <code
              ref={searchRef}
              contentEditable
              suppressContentEditableWarning
              onInput={(e) => setSearch(String(e.currentTarget.textContent))}
              className="p-4 bg-slate-200 block"
            >
              {JSON.stringify(initialSearch, null, 2)}
            </code>
          </pre>
        </>
      )}
      <div className="flex gap-4 justify-between">
        <button
          disabled={!hydrated || loading}
          type="submit"
          className="border py-2 px-4 border-gray-400 block mt-4"
        >
          {loading ? "Sending..." : "Send"}
        </button>
        <button
          type="button"
          onClick={() => {
            if (bodyRef?.current?.textContent) {
              bodyRef.current.textContent = JSON.stringify(
                initialBody,
                null,
                2
              );
            }
            if (pathRef?.current?.textContent) {
              pathRef.current.textContent = JSON.stringify(
                initialPath,
                null,
                2
              );
            }
            if (searchRef?.current?.textContent) {
              searchRef.current.textContent = JSON.stringify(
                initialSearch,
                null,
                2
              );
            }
            if (form) {
              formRef.current?.reset();
            }
            setResponse(undefined);
          }}
          className="border py-2 px-4 border-gray-400 block mt-4"
        >
          Reset
        </button>
      </div>
      {response && (
        <>
          <span className="block mt-4">response ({response.status}):</span>
          <pre>
            <code className="p-4 bg-slate-200 block max-h-[400px] overflow-y-auto">
              {response.json}
            </code>
          </pre>
        </>
      )}
    </form>
  );
}
