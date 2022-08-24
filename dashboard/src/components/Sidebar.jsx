import React from "react";
import { Link, NavLink } from "react-router-dom";
// import { BsShopWindow } from "react-icons/bs";
import { MdOutlineCancel, MdOutlineDashboard } from "react-icons/md";
import { TooltipComponent } from "@syncfusion/ej2-react-popups";

import { links } from "../data/dummy";

const Sidebar = () => {
  const activeMenu = true;

  const activeLink =
    "flex items-center gap-5 p-1 pl-6 rounded-lg text-white text-md m-2 bg-gray-400";
  const normalLink =
    "flex items-center gap-5 pl-1 -pt-3 pb-2.5 rounded-lg text-md text-gray-700 dark:text-gray-200 dark:hover:text-black hover:bg-light-gray m-2";

  return (
    <div className="ml-3 h-screen md:overflow-hidden overflow-auto md:hover:overflow-auto pb-10">
      {activeMenu && (
        <div className="flex justify-between items-center">
          <Link
            to="/"
            onClick={() => {}}
            className="items-center ml-3 gap-3 mt-4 flex text-xl font-extrabold tracking-wide dark:text-white text-slate-700"
          >
            <MdOutlineDashboard />
            <span>Dashboard</span>
          </Link>
          <TooltipComponent content="Menu" position="BottomCenter">
            <button
              type="button"
              onClick={() => {}}
              className="text-xl rounded-full p-3 hover:bg-light-gray mt-4 block md:hidden"
            >
              <MdOutlineCancel />
            </button>
          </TooltipComponent>
        </div>
      )}
      <div className="mt-10">
        {links.map((parent) => (
          <div key={parent.title}>
            <p className="m-3 mt-4 text-gray-400 uppercase">{parent.title}</p>
            {parent.links.map((link) => (
              <NavLink
                to={`/${link.name}`}
                key={link.name}
                onClick={() => {}}
                className={({ isActive }) =>
                  isActive ? activeLink : normalLink
                }
                //* isActive is a state property of NavLink
              >
                {link.icon}
                <span className="capitalize ">{link.name}</span>
              </NavLink>
            ))}
          </div>
        ))}
      </div>
    </div>
  );
};

export default Sidebar;
