import { upArrow } from "@syncfusion/ej2-react-grids";
import { itemClick } from "@syncfusion/ej2/treemap";
import React, { createContext, useContext, useState, useEffect } from "react";

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
  const [screenSize, setScreenSize] = useState(undefined);

  const [themeSettings, setThemeSettings] = useState(false);
  const [currentMode, setCurrentMode] = useState("Dark");
  const [currentColor, setCurrentColor] = useState("#1A97F5");
  const [userData, setUserData] = useState({
    id: 1,
    name: "Nima",
    email: "nimakarimi676@gmail.com",
  });

  const setMode = (e) => {
    setCurrentMode(e.target.value);
    window.localStorage.setItem("localMode", e.target.value);
    setThemeSettings(false);
  };

  const setColor = (color) => {
    setCurrentColor(color);
    window.localStorage.setItem("localColor", color);
    setThemeSettings(false);
  };

  useEffect(() => {
    const localData = {
      mode: window.localStorage.getItem("localMode"),
      color: window.localStorage.getItem("localColor"),
    };

    if (localData.color) setCurrentColor(localData.color);
    if (localData.mode) setCurrentMode(localData.mode);
  }, [currentColor, currentMode]);

  const handleClick = (itemClicked) => {
    setIsClicked((prev) => ({
      ...initialState,
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
        screenSize,
        setScreenSize,
        themeSettings,
        setThemeSettings,
        currentColor,
        setCurrentColor,
        currentMode,
        setCurrentMode,
        setMode,
        setColor,
        userData,
      }}
    >
      {children}
    </StateContext.Provider>
  );
};

export const useStateContext = () => useContext(StateContext);
