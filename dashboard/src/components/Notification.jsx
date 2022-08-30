import React from "react";
import { MdOutlineCancel } from "react-icons/md";

import { Button } from ".";
import { chatData } from "../data/dummy";
import { useStateContext } from "../contexts/ContextProvider";

const Notification = () => {
  const { currentColor, handleClick } = useStateContext();

  return (
    <div className="absolute top-20 right-10 md:right-36 bg-white dark:bg-main-dark-bg drop-shadow-2xl shadow-inner shadow-gray-300 dark:shadow-gray-600 z-10 h-auto w-96 p-7 px-9 rounded-3xl">
      <div className="flex justify-between items-center">
        <div className="flex gap-3">
          <p className="font-semibold text-lg dark:text-gray-200">
            Notifications
          </p>
          <button
            type="button"
            className="text-red-500 text-xs rounded p-1 px-2 bg-orange-theme "
          >
            5 New
          </button>
        </div>
        <button
          type="button"
          onClick={() => handleClick("notification")}
          className="text-xl rounded-full p-2 hover:bg-light-gray dark:text-white dark:hover:bg-slate-600"
        >
          <MdOutlineCancel />
        </button>
      </div>
      <div className="mt-5 ">
        {chatData?.map((item, index) => (
          <div
            key={index}
            className="flex items-center leading-8 gap-5 border-b-1 border-color p-3"
          >
            <img
              className="rounded-full h-10 w-10"
              src={item.image}
              alt={item.message}
            />
            <div>
              <p className="font-semibold dark:text-gray-200">{item.message}</p>
              <p className="text-gray-500 text-sm dark:text-gray-400">
                {" "}
                {item.desc}{" "}
              </p>
            </div>
          </div>
        ))}
        <div className="mt-5">
          <Button
            color="white"
            bgColor={currentColor}
            text="See all notifications"
            borderRadius="10px"
            width="full"
          />
        </div>
      </div>
    </div>
  );
};

export default Notification;
