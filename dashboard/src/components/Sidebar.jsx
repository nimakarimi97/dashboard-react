import React from "react";
import { Link, NavLink } from "react-router-dom";
// import { BsShopWindow } from "react-icons/bs";
import { MdOutlineCancel, MdOutlineDashboard } from "react-icons/md";
import { TooltipComponent } from "@syncfusion/ej2-react-popups";

import { links } from "../data/dummy";
import { useStateContext } from "../contexts/ContextProvider";

const Sidebar = () => {
  const { activeMenu, setActiveMenu, screenSize, currentColor } =
    useStateContext();

  const activeLink =
    "flex items-center gap-5 p-1 pl-6 hover:py-1 rounded-lg text-white text-md m-2";
  const normalLink =
    "flex items-center gap-5 pl-1 py-1 rounded-lg text-md m-2 text-gray-700 dark:text-gray-200 dark:hover:text-black hover:bg-light-gray";

  const handleCloseSidebar = () => {
    if (activeMenu && screenSize <= 900) setActiveMenu(false);
  };

  return (
    <div className="ml-3 h-screen md:overflow-hidden overflow-auto md:hover:overflow-auto pb-10">
      {activeMenu && (
        <div className="flex justify-between items-center">
          <Link
            to="/"
            // onClick={() => setActiveMenu(false)}
            className="items-center ml-3 gap-3 mt-4 flex text-xl font-extrabold tracking-wide dark:text-white text-slate-700"
          >
            <MdOutlineDashboard />
            <span>Dashboard</span>
          </Link>
          <TooltipComponent content="Close Sidebar" position="BottomCenter">
            <button
              type="button"
              onClick={handleCloseSidebar}
              className="text-xl rounded-full p-2 hover:bg-light-gray mt-4 block md:hidden dark:text-white dark:hover:bg-slate-600"
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
                onClick={handleCloseSidebar}
                className={({ isActive }) =>
                  isActive ? activeLink : normalLink
                }
                //* isActive is a state property of NavLink

                style={({ isActive }) => ({
                  backgroundColor: isActive ? currentColor : "",
                })}
              >
                {link.icon}
                <span className="capitalize">{link.name}</span>
              </NavLink>
            ))}
          </div>
        ))}
      </div>
    </div>
  );
};

export default Sidebar;
