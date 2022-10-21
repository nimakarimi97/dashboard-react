import React, { useEffect } from "react";
import { AiOutlineMenu } from "react-icons/ai";
import { FiShoppingCart } from "react-icons/fi";
import { BsChatLeft } from "react-icons/bs";
import { RiNotification3Line } from "react-icons/ri";
import { MdKeyboardArrowDown } from "react-icons/md";
import { TooltipComponent } from "@syncfusion/ej2-react-popups";

import avatar from "../data/avatar.jpg";
import myAvatar from "../data/myAvatar.jpg";
import { Cart, Chat, Notification, UserProfile } from ".";
import { useStateContext } from "../contexts/ContextProvider";
import { Arrow } from "@syncfusion/ej2/maps";
import { userProfileData } from "../data/dummy";
import ColorMapping from "../pages/Charts/ColorMapping";

const NavBtn = ({
  title,
  customFunction,
  icon,
  color,
  dotColor,
  isClicked,
}) => (
  <TooltipComponent content={title} position="BottomCenter">
    <button
      type="button"
      onClick={() => customFunction()}
      style={{ color }}
      className="relative text-xl rounded-full p-3 hover:bg-gray-100 dark:hover:bg-gray-700"
    >
      <span
        style={{
          background: dotColor,
          display:
            title === "Notification" && isClicked.notification ? "none" : "",
        }}
        className="absolute inline-flex rounded-full h-2 w-2 right-2 top-2"
      >
        {/* this is for the dot above the icon */}
      </span>
      {icon}
    </button>
  </TooltipComponent>
);

const Navbar = () => {
  const {
    activeMenu,
    setActiveMenu,
    isClicked,
    setIsClicked,
    handleClick,
    screenSize,
    setScreenSize,
    currentColor,
    userData,
  } = useStateContext();

  useEffect(() => {
    const handleResize = () => setScreenSize(window.innerWidth);
    window.addEventListener("resize", handleResize);
    handleResize();

    return () => {
      window.removeEventListener("resize", handleResize);
    };
  }, []);

  useEffect(() => {
    screenSize <= 900 ? setActiveMenu(false) : setActiveMenu(true);
  }, [screenSize]);

  return (
    <div className="flex justify-between p-2 md:mx-6 relative">
      <NavBtn
        title="Menu"
        customFunction={() => {
          setActiveMenu((prevActiveMenu) => !prevActiveMenu);
        }}
        color={currentColor}
        icon={<AiOutlineMenu />}
        dotColor=""
      />
      <div className="flex">
        <NavBtn
          title="Cart"
          customFunction={() => handleClick("cart")}
          color={currentColor}
          icon={<FiShoppingCart />}
          dotColor="green"
        />

        <NavBtn
          title="Chat"
          customFunction={() => handleClick("chat")}
          color={currentColor}
          icon={<BsChatLeft />}
          dotColor="red"
        />

        <NavBtn
          title="Notification"
          customFunction={() => handleClick("notification")}
          color={currentColor}
          icon={<RiNotification3Line />}
          dotColor="red"
          isClicked={isClicked}
        />

        <TooltipComponent content="Profile" position="BottomCenter">
          <div
            onClick={() => handleClick("userProfile")}
            className="flex item-center gap-2 p-2 cursor-pointer rounded-full hover:bg-gray-100 dark:hover:bg-gray-700"
          >
            <img src={myAvatar} className="rounded-full w-8 h-8" />
            <p className="text-gray-500 text-14 dark:text-gray-200 my-auto">
              <span>Hi, </span>
              <span className="font-bold">{userData.name}</span>
            </p>
            <MdKeyboardArrowDown className="text-gray-500 text-14" />
          </div>
        </TooltipComponent>

        {isClicked.cart && <Cart />}
        {isClicked.chat && <Chat />}
        {isClicked.notification && <Notification />}
        {isClicked.userProfile && <UserProfile />}
      </div>
    </div>
  );
};

export default Navbar;
