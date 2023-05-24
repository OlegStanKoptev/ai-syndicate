import type {
  ActionFunction,
  AppData,
  LoaderFunction,
  MetaFunction,
} from "@remix-run/node";
import { redirect } from "@remix-run/node";
import type { RouteMatch } from "@remix-run/react";
import { useFormAction } from "@remix-run/react";
import { useSearchParams } from "@remix-run/react";
import {
  Form,
  Link,
  useActionData,
  useLoaderData,
  useSubmit,
  useTransition,
} from "@remix-run/react";
import { Controller, useForm } from "react-hook-form";
import { z } from "zod";
import {
  Button,
  InputWrapper,
  Textarea,
  TextInput,
  UnexpectedError,
} from "~/components";
import type { FormattedZodError } from "~/utils.server";
import { requireCurrentAdmin } from "~/utils.server";
import { formatZodError } from "~/utils.server";
import { zodResolver } from "@hookform/resolvers/zod";
import { db } from "~/db.server";
import type { Startup } from "@prisma/client";
import invariant from "tiny-invariant";
import { useSpinDelay } from "spin-delay";
import {
  deserialize,
  serialize,
  useFocusFieldOnServerValidationError,
} from "~/utils";

const schema = z.object({
  name: z.string().min(1, "Required"),
  description: z.string().min(1, "Required"),
});

type ActionData = {
  errors: FormattedZodError<z.infer<typeof schema>>;
};

export const action: ActionFunction = async ({ request, params }) => {
  const { startupId } = params;
  invariant(startupId);
  await requireCurrentAdmin(request);
  const data = Object.fromEntries(await request.formData());
  const validationResult = schema.safeParse(data);
  if (!validationResult.success) {
    return new Response(
      serialize<ActionData>({ errors: formatZodError(validationResult.error) }),
      { status: 400 }
    );
  }
  const validatedData = validationResult.data;
  const startup = await db.startup.update({
    where: { id: startupId },
    data: validatedData,
  });
  return redirect(`/admin/startups/${startup.id}`);
};

type LoaderData = {
  startup: Startup;
};

export const meta: MetaFunction = (args) => {
  const data = deserialize<LoaderData>(args.data as string | undefined);
  return {
    title: `AI Syndicate (admin) | Edit startup «${
      data ? data.startup.name : "?"
    }»`,
  };
};

export const handle = {
  breadcrumb: (match: RouteMatch & { data: AppData }) => {
    const { startupId } = match.params;
    return match.data ? (
      <Link to={`/admin/startups/${startupId}/edit`}>Edit</Link>
    ) : (
      "Edit"
    );
  },
};

export const loader: LoaderFunction = async ({ request, params }) => {
  const { startupId } = params;
  invariant(startupId);
  await requireCurrentAdmin(request);
  const startup = await db.startup.findUnique({ where: { id: startupId } });
  if (!startup) {
    throw new Response(`Startup with this id: ${startupId} not found`, {
      status: 404,
    });
  }
  return new Response(serialize<LoaderData>({ startup }));
};

type FormValues = {
  name: string;
  description: string;
};

export default function StartupEdit() {
  const data = deserialize<LoaderData>(useLoaderData());
  const [searchParams] = useSearchParams();
  const redirectTo = searchParams.get("redirectTo");
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
      name: data.startup.name,
      description: data.startup.description,
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
      onSubmit={(e) => {
        handleSubmit(() => submit(e.target as HTMLFormElement))(e);
      }}
      replace
      className="m-4 max-w-3xl"
    >
      <h1 className="mb-4 text-xl">
        Edit startup{" "}
        <Link to=".." className="text-blue-400">
          {data.startup.name}
        </Link>
      </h1>
      <div className="grid grid-cols-2 gap-4">
        <Controller
          name="name"
          control={control}
          render={({ field }) => (
            <InputWrapper
              required
              label="Name"
              error={clientErrors.name?.message ?? actionData?.errors.name}
            >
              <TextInput {...field} />
            </InputWrapper>
          )}
        />
        <div />
        <Controller
          name="description"
          control={control}
          render={({ field }) => (
            <InputWrapper
              required
              label="Description"
              error={
                clientErrors.description?.message ??
                actionData?.errors.description
              }
            >
              <Textarea {...field} />
            </InputWrapper>
          )}
        />
      </div>
      <input type="hidden" name="redirectTo" value={redirectTo ?? ""} />
      <Button type="submit" className="mt-16" loading={isSubmitting}>
        Save
      </Button>
    </Form>
  );
}

export function ErrorBoundary({ error }: { error: Error }) {
  console.error(error);
  return (
    <UnexpectedError
      error={error}
      tryAgainElement={
        <Link to="#" className="font-normal text-blue-300">
          Try again
        </Link>
      }
      className="mt-4"
    />
  );
}
