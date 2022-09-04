import React from "react";
import { MdOutlineCancel } from "react-icons/md";

import { useStateContext } from "../contexts/ContextProvider";
import myAvatar from "../data/myAvatar.jpg";
import { userProfileData } from "../data/dummy";

const UserProfile = () => {
  const { currentColor, userData, handleClick } = useStateContext();

  return (
    <div className="absolute top-20 right-10 bg-white dark:bg-main-dark-bg drop-shadow-2xl shadow-inner shadow-gray-300 dark:shadow-gray-600 z-10 h-auto w-150 p-7 px-9 rounded-3xl">
      <div className="flex  justify-between items-center">
        <p className="text-xl font-semibold">User Profile</p>
        <button
          type="button"
          onClick={() => handleClick("userProfile")}
          className="text-xl rounded-full p-2 hover:bg-light-gray dark:text-white dark:hover:bg-slate-600"
        >
          <MdOutlineCancel />
        </button>
      </div>

      <div className="flex py-4 border-b-1 border-gray-500 dark:border-gray-300">
        <img src={myAvatar} className="rounded-full w-20 h-20 mr-5 " />
        <div>
          <p className="text-xl font-semibold dark:text-white">
            {userData.name + " " + userData.lastName}
          </p>
          <p className="text-sm dark:text-gray-300 my-1.5">{userData.email}</p>
        </div>
      </div>

      <div>
        {userProfileData.map((item, index) => (
          <div
            key={index}
            className="flex gap-5 border-b-1 border-gray-500 dark:border-gray-300 p-4 hover:bg-gray-200 cursor-pointer  dark:hover:bg-[#42464D] rounded-sm"
          >
            <button
              type="button"
              style={{ color: item.iconColor, backgroundColor: item.iconBg }}
              className=" text-xl rounded-lg p-3 hover:bg-light-gray"
            >
              {item.icon}
            </button>
            <div>
              <p className="font-semibold dark:text-gray-200 ">{item.title}</p>
              <p className="text-gray-500 text-sm dark:text-gray-400">
                {item.desc}
              </p>
            </div>
          </div>
        ))}
        {/* logout btn */}
        <button
          type="button"
          className="rounded-xl p-3 hover:bg-fwhite mt-5 hover:drop-shadow-xl hover:bg-light-gray w-full text-white"
          onClick={() => {}}
          style={{ background: currentColor }}
        >
          Logout
        </button>
      </div>
    </div>
  );
};

export default UserProfile;
