import { Link, Outlet } from "@remix-run/react";

export const handle = {
  breadcrumb: () => <Link to="users">Users</Link>,
};

export default function Users() {
  return <Outlet />;
}
