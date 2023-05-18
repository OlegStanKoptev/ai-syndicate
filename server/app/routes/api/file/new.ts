import type { ActionFunction, NodeOnDiskFile } from "@remix-run/node";
import { json } from "@remix-run/node";
import {
  unstable_composeUploadHandlers,
  unstable_createFileUploadHandler,
  unstable_createMemoryUploadHandler,
  unstable_parseMultipartFormData,
} from "@remix-run/node";

export const action: ActionFunction = async ({ request }) => {
  const uploadHandler = unstable_composeUploadHandlers(
    unstable_createFileUploadHandler({
      maxPartSize: 5_000_000,
      file: ({ filename }) => filename,
      directory: "public/files",
    }),
    // parse everything else into memory
    unstable_createMemoryUploadHandler()
  );
  const formData = await unstable_parseMultipartFormData(
    request,
    uploadHandler
  );
  const file = formData.get("file") as NodeOnDiskFile | null;
  if (!file) {
    return json({ message: "File is required" }, { status: 400 });
  }
  if (!file.name) {
    return json({ message: "File is required" }, { status: 400 });
  }
  return json({ file: file.name });
};
