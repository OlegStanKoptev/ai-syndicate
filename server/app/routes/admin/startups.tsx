import { Link, Outlet } from "@remix-run/react";

export const handle = {
  breadcrumb: () => <Link to="startups">Startups</Link>,
};

export default function Startups() {
  return <Outlet />;
}
