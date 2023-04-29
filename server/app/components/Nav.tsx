import { NavLink } from "@remix-run/react";
import { twMerge } from "tailwind-merge";

interface NavProps
  extends React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLElement>,
    HTMLElement
  > {
  navItems: {
    id?: string | number;
    path: string;
    name: string;
    end?: boolean;
  }[];
}

const Nav = ({ navItems, className, ...props }: NavProps) => {
  return (
    <nav className={twMerge("flex w-full px-2", className)} {...props}>
      {navItems.map((navItem) => (
        <NavLink
          key={navItem.id ?? `${navItem.path}__${navItem.name}`}
          to={navItem.path}
          end={navItem.end}
          className={({ isActive }) =>
            twMerge(
              "mx-2 flex items-center p-2 font-bold no-underline",
              isActive
                ? "border-blue-400 text-blue-400"
                : "border-transparent text-gray-600"
            )
          }
        >
          <div>{navItem.name}</div>
        </NavLink>
      ))}
    </nav>
  );
};

export default Nav;
