import { Link, Outlet } from "@remix-run/react";

export const handle = {
  breadcrumb: () => (
    <Link to="applications-new-developer">New developer applications</Link>
  ),
};

export default function ApplicationsNewDeveloper() {
  return <Outlet />;
}
