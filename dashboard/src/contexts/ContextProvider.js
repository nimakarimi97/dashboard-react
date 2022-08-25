import { itemClick } from "@syncfusion/ej2/treemap";
import React, { createContext, useContext, useState } from "react";

const StateContext = createContext();

const initialState = {
  cart: false,
  chat: false,
  notification: false,
  userProfile: false,
};

export const ContextProvider = ({ children }) => {
  const [activeMenu, setActiveMenu] = useState(true);
  const [isClicked, setIsClicked] = useState(initialState);

  const handleClick = (itemClicked) => {
    setIsClicked((prev) => ({
      ...prev,
      [itemClicked]: !prev[itemClicked],
    }));
  };
  return (
    <StateContext.Provider
      value={{
        thisObject: "will be passed through every component",
        activeMenu,
        setActiveMenu,
        isClicked,
        setIsClicked,
        handleClick,
      }}
    >
      {children}
    </StateContext.Provider>
  );
};

export const useStateContext = () => useContext(StateContext);
