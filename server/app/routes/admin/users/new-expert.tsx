import type {
  ActionFunction,
  LoaderFunction,
  MetaFunction,
} from "@remix-run/node";
import { redirect } from "@remix-run/node";
import bycript from "bcryptjs";
import {
  Form,
  Link,
  useActionData,
  useFormAction,
  useSubmit,
  useTransition,
} from "@remix-run/react";
import { Controller, useForm } from "react-hook-form";
import { z } from "zod";
import { Button, InputWrapper, TextInput, UnexpectedError } from "~/components";
import type { FormattedZodError } from "~/utils.server";
import { newServerDate } from "~/utils.server";
import { formatZodError, requireCurrentAdmin } from "~/utils.server";
import { zodResolver } from "@hookform/resolvers/zod";
import { db } from "~/db.server";
import { useSpinDelay } from "spin-delay";
import {
  deserialize,
  serialize,
  useFocusFieldOnServerValidationError,
} from "~/utils";

const schema = z.object({
  email: z.string().email(),
  password: z.string().min(1),
  fullName: z.string().min(1),
});

type ActionData = {
  errors: FormattedZodError<z.infer<typeof schema>>;
};

export const action: ActionFunction = async ({ request }) => {
  const admin = await requireCurrentAdmin(request);
  const data = Object.fromEntries(await request.formData());
  const validationResult = schema.safeParse(data);
  if (!validationResult.success) {
    return new Response(
      serialize<ActionData>({ errors: formatZodError(validationResult.error) }),
      { status: 400 }
    );
  }
  const validatedData = validationResult.data;
  const existingExpert = await db.user.findUnique({
    where: { email: validatedData.email },
  });
  if (existingExpert) {
    return new Response(
      serialize<ActionData>({
        errors: { email: "User with this email exists" },
      })
    );
  }
  const expert = await db.user.create({
    data: {
      role: "expert",
      email: validatedData.email,
      passwordHash: await bycript.hash(validatedData.password, 10),
      fullName: validatedData.fullName,
      createdById: admin.id,
      createdAt: await newServerDate(),
      updatedAt: await newServerDate(),
    },
  });
  return redirect(`/admin/users/${expert.id}`);
};

export const meta: MetaFunction = () => {
  return {
    title: "AI Syndicate (admin) | New expert",
  };
};

export const handle = {
  breadcrumb: () => <Link to="/admin/new-expert">New expert</Link>,
};

export const loader: LoaderFunction = async ({ request }) => {
  await requireCurrentAdmin(request);
  return new Response();
};

type FormValues = {
  email: string;
  password: string;
  fullName: string;
};

export default function NewExpert() {
  const actionData = deserialize<ActionData>(useActionData());
  const actionUrl = useFormAction();
  const transition = useTransition();
  const submit = useSubmit();
  const {
    control,
    handleSubmit,
    formState: { errors: clientErrors },
    setFocus,
  } = useForm<FormValues>({
    defaultValues: {
      email: "",
      password: "",
      fullName: "",
    },
    resolver: zodResolver(schema),
  });
  useFocusFieldOnServerValidationError({ actionData, setFocus });
  const isSubmitting = useSpinDelay(
    transition.state === "submitting" &&
      transition.location.pathname === actionUrl
  );
  return (
    <Form
      method="post"
      replace
      onSubmit={(e) => {
        handleSubmit(() => submit(e.target as HTMLFormElement))(e);
      }}
      className="m-4 max-w-3xl"
    >
      <h1 className="mb-4 text-xl">New expert</h1>
      <div className="grid grid-cols-2 gap-4">
        <Controller
          name="email"
          control={control}
          render={({ field }) => (
            <InputWrapper
              required
              label="Email"
              error={clientErrors.email?.message ?? actionData?.errors.email}
            >
              <TextInput {...field} />
            </InputWrapper>
          )}
        />
        <div />
        <Controller
          name="fullName"
          control={control}
          render={({ field }) => (
            <InputWrapper
              required
              label="Full name"
              error={
                clientErrors.fullName?.message ?? actionData?.errors.fullName
              }
            >
              <TextInput {...field} />
            </InputWrapper>
          )}
        />
        <div />
        <Controller
          name="password"
          control={control}
          render={({ field }) => (
            <InputWrapper
              required
              label="Password"
              error={
                clientErrors.password?.message ?? actionData?.errors.password
              }
            >
              <TextInput
                type="password"
                autoComplete="new-password"
                {...field}
              />
            </InputWrapper>
          )}
        />
        <div />
      </div>
      <Button type="submit" className="mt-16" loading={isSubmitting}>
        Create
      </Button>
    </Form>
  );
}

export function ErrorBoundary({ error }: { error: Error }) {
  console.error(error);
  return (
    <UnexpectedError
      tryAgainElement={
        <Link to="#" className="font-normal text-blue-300">
          Try again
        </Link>
      }
      error={error}
      className="mt-4"
    />
  );
}
