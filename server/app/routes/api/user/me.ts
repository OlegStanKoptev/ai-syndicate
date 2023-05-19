import type { LoaderFunction } from "@remix-run/server-runtime";
import { json } from "@remix-run/server-runtime";
import invariant from "tiny-invariant";
import { requireCurrentApiUser } from "~/utils.server";

export const loader: LoaderFunction = async ({ request }) => {
  const user = await requireCurrentApiUser(request);
  const commonFields = {
    id: user.id,
    role: user.role,
    email: user.email,
    avatarImageFile: user.avatarImageFile,
  };
  if (user.role === "user") {
    return json({
      ...commonFields,
      fullName: user.fullName,
      balance: user.balance,
    });
  }
  if (user.role === "expert") {
    return json({
      ...commonFields,
      fullName: user.fullName,
    });
  }
  if (user.role === "developer") {
    return json({
      ...commonFields,
      orgName: user.orgName,
      shortOrgName: user.shortOrgName,
      inn: user.inn,
      ogrn: user.ogrn,
      kpp: user.kpp,
      legalAddress: user.legalAddress,
      actualAddress: user.actualAddress,
      website: user.website,
      phone: user.phone,
    });
  }
  invariant(false, `Unexpected role: ${user.role}`);
};
