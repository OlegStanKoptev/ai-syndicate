import type {
  ActionFunction,
  LoaderFunction,
  MetaFunction,
} from "@remix-run/node";
import { redirect } from "@remix-run/node";
import {
  Form,
  Link,
  useActionData,
  useSearchParams,
  useTransition,
} from "@remix-run/react";
import invariant from "tiny-invariant";
import { db } from "~/db.server";
import bcrypt from "bcryptjs";
import { getCurrentUser, login } from "~/utils.server";
import {
  Button,
  Checkbox,
  InputWrapper,
  Spinner,
  TextInput,
  UnexpectedError,
} from "~/components";
import { useSpinDelay } from "~/components";
import type { ReactNode } from "react";
import { deserialize, serialize } from "~/utils";

type ActionData = {
  errors?: {
    email?: string;
    password?: string;
  };
};

export const action: ActionFunction = async ({ request }) => {
  const data = Object.fromEntries(await request.formData());
  const { email, password, redirectTo } = data;
  const rememberMe = data.rememberMe === "on";
  invariant(
    typeof email === "string" &&
      typeof password === "string" &&
      typeof redirectTo === "string"
  );
  const user = await db.user.findUnique({
    where: { email },
  });
  if (!user || user.role !== "admin") {
    return new Response(
      serialize<ActionData>({
        errors: { email: "Admin with this email does not exist" },
      }),
      { status: 401 }
    );
  }
  const isPasswordCorrect = await bcrypt.compare(password, user.passwordHash);
  if (!isPasswordCorrect) {
    return new Response(
      serialize<ActionData>({ errors: { password: "Wrong password" } }),
      { status: 401 }
    );
  }
  return await login(request, user.id, rememberMe, redirectTo || "/admin");
};

export const loader: LoaderFunction = async ({ request }) => {
  const redirectTo = new URL(request.url).searchParams.get("redirectTo");
  const user = await getCurrentUser(request);
  if (user && user.role === "admin") {
    return redirect(redirectTo ?? "/admin");
  }
  return null;
};

export const meta: MetaFunction = () => {
  return {
    title: "AI Syndicate (admin) | Log in",
  };
};

export default function Login() {
  const [searchParams] = useSearchParams();
  const actionData = deserialize<ActionData>(useActionData());
  const transition = useTransition();
  const isLoadingPage = useSpinDelay(transition.state === "loading");
  const isSubmitting = useSpinDelay(
    transition.state === "submitting" &&
      transition.location.pathname === "/login"
  );
  return (
    <>
      <Layout>
        <div className="relative mt-20 w-full max-w-sm rounded bg-white p-8 border">
          <h1 className="mb-20 text-center font-bold text-lg">Log in</h1>
          <Form method="post" replace className="flex flex-col gap-5">
            <input
              type="hidden"
              name="redirectTo"
              value={searchParams.get("redirectTo") ?? ""}
            />
            <InputWrapper
              required
              label="Email"
              error={actionData?.errors?.email}
            >
              <TextInput type="email" name="email" />
            </InputWrapper>
            <InputWrapper
              required
              label="Password"
              error={actionData?.errors?.password}
            >
              <TextInput type="password" name="password" />
            </InputWrapper>
            <Button type="submit" className="mt-5" loading={isSubmitting}>
              Log in
            </Button>
            <Checkbox name="rememberMe" label="Remember me" />
          </Form>
          <Link to="/admin" className="text-blue-400 mt-4 text-right block">
            Or continue as guest
          </Link>
        </div>
      </Layout>
      {isLoadingPage && (
        <Spinner className="fixed bottom-4 right-4 h-12 w-12 fill-white text-blue-600" />
      )}
    </>
  );
}

export function ErrorBoundary({ error }: { error: Error }) {
  console.error(error);
  return (
    <Layout>
      <UnexpectedError
        error={error}
        tryAgainElement={
          <Link to="#" className="font-normal text-blue-300">
            Try again
          </Link>
        }
        className="mt-6"
      />
    </Layout>
  );
}

function Layout({ children }: { children?: ReactNode }) {
  return (
    <main className="flex h-full flex-col items-center justify-center">
      <h1 className="text-3xl font-bold text-white">AI Syndicate | Admin</h1>
      {children}
    </main>
  );
}
