import React, { startTransition } from "react";
import { MdOutlineCancel } from "react-icons/md";
import { BsCheck } from "react-icons/bs";
import { TooltipComponent } from "@syncfusion/ej2-react-popups";

import { themeColors } from "../data/dummy";
import { useStateContext } from "../contexts/ContextProvider";
import { itemClick } from "@syncfusion/ej2/treemap";

const ThemeSettings = () => {
  const { setThemeSettings, setColor, setMode, currentColor, currentMode } =
    useStateContext();

  return (
    <div className="bg-half-transparent w-screen fixed nav-item top-0 right-0">
      <div className="float-right h-screen dark:text-gray-200  bg-white dark:bg-[#484B52] w-400">
        <div className="flex justify-between items-center p-4 ml-4">
          <p className="font-extrabold text-xl">Settings</p>
          <button
            type="button"
            onClick={() => setThemeSettings(false)}
            style={{ color: "rgb(153, 171, 180)", borderRadius: "50%" }}
            className="text-2xl m-3 p-1 hover:drop-shadow-xl hover:bg-light-gray"
          >
            <MdOutlineCancel />
          </button>
        </div>

        <div className="flex-col border-t-1 border-t-gray-400 p-4 mx-5">
          <p className="font-semibold text-lg">Theme Options</p>

          <div className="mt-4">
            <input
              type="radio"
              id="light"
              value="Light"
              name="theme"
              onChange={setMode}
              checked={currentMode === "Light"}
              className="cursor-pointer"
            />
            <label htmlFor="light" className="cursor-pointer ml-2 text-md">
              Light Mode
            </label>
          </div>

          <div className="mt-4">
            <input
              type="radio"
              id="dark"
              value="Dark"
              name="theme"
              onChange={setMode}
              checked={currentMode === "Dark"}
              className="cursor-pointer"
            />
            <label htmlFor="dark" className="cursor-pointer ml-2 text-md">
              Dark Mode
            </label>
          </div>
        </div>

        <div className="flex-col border-t-1 border-t-gray-400 p-4 mx-5">
          <p className="font-semibold text-lg">Theme Colors</p>

          <div className="flex gap-3 justify-evenly mt-2">
            {themeColors.map((item, index) => (
              <TooltipComponent
                key={index}
                content={item.name}
                position="BottomCenter"
              >
                <div
                  key={index}
                  className="cursor-pointer flex gap-5 items-center relative mt-2"
                >
                  <button
                    type="button"
                    className="w-10 h-10 rounded-full"
                    style={{ backgroundColor: item.color }}
                    onClick={() => setColor(item.color)}
                  >
                    <BsCheck
                      className={`m-2 text-2xl text-white ${
                        item.color === currentColor ? "block" : "hidden"
                      }`}
                    />
                  </button>
                </div>
              </TooltipComponent>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};

export default ThemeSettings;
