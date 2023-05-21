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
import { Button, InputWrapper, Textarea, UnexpectedError } from "~/components";
import type { FormattedZodError } from "~/utils.server";
import { formatZodError, requireCurrentAdmin } from "~/utils.server";
import { zodResolver } from "@hookform/resolvers/zod";
import { db } from "~/db.server";
import type { ApplicationNewDeveloper } from "@prisma/client";
import invariant from "tiny-invariant";
import { useSpinDelay } from "spin-delay";
import {
  deserialize,
  serialize,
  useFocusFieldOnServerValidationError,
} from "~/utils";

const schema = z.object({
  declineReason: z.string().min(1, "Required"),
});

type ActionData = {
  errors: FormattedZodError<z.infer<typeof schema>>;
};

export const action: ActionFunction = async ({ request, params }) => {
  const { applicationNewDeveloperId } = params;
  invariant(applicationNewDeveloperId);
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
  const applicationNewDeveloper = await db.applicationNewDeveloper.findUnique({
    where: { id: applicationNewDeveloperId },
  });
  if (!applicationNewDeveloper) {
    throw new Response(
      `New developer application with this id: ${applicationNewDeveloperId} not found`,
      {
        status: 404,
      }
    );
  }
  if (applicationNewDeveloper.status !== "new") {
    throw new Response(
      "Can only decline new developer applications that are in 'new' status",
      { status: 409 }
    );
  }
  await db.applicationNewDeveloper.update({
    where: { id: applicationNewDeveloperId },
    data: {
      status: "declined",
      declineReason: validatedData.declineReason,
      approvedOrDeclinedById: admin.id,
      approvedOrDeclinedAt: new Date(),
    },
  });
  return redirect(
    `/admin/applications-new-developer/${applicationNewDeveloperId}`
  );
};

type LoaderData = {
  applicationNewDeveloper: ApplicationNewDeveloper;
};

export const meta: MetaFunction = (args) => {
  const data = deserialize<LoaderData>(args.data as string | undefined);
  return {
    title: `AI Syndicate (admin) | Decline new developer application ${
      data ? data.applicationNewDeveloper.shortOrgName : "?"
    }`,
  };
};

export const handle = {
  breadcrumb: (match: RouteMatch & { data: AppData }) => {
    const { applicationNewDeveloperId } = match.params;
    return match.data ? (
      <Link
        to={`/admin/applications-new-developer/${applicationNewDeveloperId}/decline`}
      >
        Decline
      </Link>
    ) : (
      "Decline"
    );
  },
};

export const loader: LoaderFunction = async ({ request, params }) => {
  const { applicationNewDeveloperId } = params;
  invariant(applicationNewDeveloperId);
  await requireCurrentAdmin(request);
  const applicationNewDeveloper = await db.applicationNewDeveloper.findUnique({
    where: { id: applicationNewDeveloperId },
  });
  if (!applicationNewDeveloper) {
    throw new Response(
      `New developer application with this id: ${applicationNewDeveloperId} not found`,
      {
        status: 404,
      }
    );
  }
  return new Response(serialize<LoaderData>({ applicationNewDeveloper }));
};

type FormValues = {
  declineReason: string;
};

export default function ApplicationNewDeveloperEdit() {
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
    defaultValues: { declineReason: "" },
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
        Decline new developer application{" "}
        <Link to=".." className="text-blue-400">
          {data.applicationNewDeveloper.shortOrgName}
        </Link>
      </h1>
      <div className="grid grid-cols-2 gap-4">
        <Controller
          name="declineReason"
          control={control}
          render={({ field }) => (
            <InputWrapper
              required
              label="Decline reason"
              error={
                clientErrors.declineReason?.message ??
                actionData?.errors.declineReason
              }
            >
              <Textarea {...field} />
            </InputWrapper>
          )}
        />
      </div>
      <input type="hidden" name="redirectTo" value={redirectTo ?? ""} />
      <Button type="submit" className="mt-16" loading={isSubmitting}>
        Decline
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
