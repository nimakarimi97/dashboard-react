import React from "react";
import { BsCurrencyDollar } from "react-icons/bs";
import { GoPrimitiveDot } from "react-icons/go";
import { IoIosMore } from "react-icons/io";
import { DropDownListComponent } from "@syncfusion/ej2-react-dropdowns";

import { Stacked, Pie, Button, LineChart, SparkLine } from "../components";
import {
  earningData,
  medicalproBranding,
  recentTransactions,
  weeklyStats,
  dropdownData,
  SparklineAreaData,
  ecomPieChartData,
  avatar,
} from "../data/dummy";
import { useStateContext } from "../contexts/ContextProvider";
import product9 from "../data/product9.jpg";
import { itemClick } from "@syncfusion/ej2/treemap";

const Ecommerce = () => {
  const { currentColor, currentMode } = useStateContext();
  return (
    <div className="mt-12">
      {/* Overview */}
      <div className="flex flex-wrap lg:flex-nowrap justify-center p-5 pl-9">
        <div className="bg-white dark:text-gray-200 dark:bg-secondary-dark-bg h-44 rounded-xl w-full md:w-800 2xl:w-400 p-8 pt-9 my-4 md:m-3 md:mx-6 bg-hero-pattern bg-no-repeat bg-cover bg-center shadow">
          <div className="flex justify-between items-center dark:text-gray-800">
            <div>
              <p className="font-bold text-gray-400">Earnings</p>
              <p>€300,000</p>{" "}
            </div>
          </div>
          <div className="mt-6">
            <Button
              color="white"
              bgColor={currentColor}
              text="Get Started"
              size="md"
              borderRadius="10px"
            />
          </div>
        </div>

        {/* //! cards */}

        <div className="flex lg:m-0 flex-wrap justify-center gap-4 items-center dark:text-white">
          {earningData.map((item) => (
            <div
              key={item.title}
              className="bg-white dark:text-gray-200 dark:bg-main-dark-bg p-4 md:p-4 xmd:pt-9 rounded-2xl w-44 md:w-52 shadow"
            >
              <button
                type="button"
                style={{
                  color: currentMode === "Light" ? item.color : "white",
                  backgroundColor: currentMode === "Light" ? item.iconBg : "",
                }}
                className="text-2xl opacity-70 rounded-full p-2 hover:opacity-100 hover:drop-shadow-xl align-middle"
              >
                {item.icon}
              </button>
              <span className="ml-4 text-gray-600 dark:text-slate-300">
                {item.title}
              </span>
              <p className="mt-3">
                <span className="text-lg font-semibold">{item.amount}</span>
                <span className={`text-${item.pcColor} ml-2`}>
                  {item.percentage}
                </span>
              </p>
            </div>
          ))}
        </div>
      </div>

      {/* revenue */}

      <div className="flex gap-10 flex-wrap justify-center">
        <div className="bg-white dark:text-gray-200 dark:bg-main-dark-bg m-3 p-4 rounded-2xl md:w-780 shadow">
          <div className="flex justify-between">
            <p className="font-semibold text-xl">Revenue Updates</p>
            <div className="flex items-center gap-4">
              <p className="flex items-center gap-2 text-gray-600 dark:text-slate-100 hover:drop-shadow-2xl">
                <span>
                  <GoPrimitiveDot />
                </span>
                <span>Expense</span>
              </p>
              <p className="flex items-center gap-2 text-green-400 hover:drop-shadow-2xl">
                <span>
                  <GoPrimitiveDot />
                </span>
                <span>Budget</span>
              </p>
            </div>
          </div>
          {/* charts */}
          <div className="mt-10 flex flex-wrap gap-10 justify-center">
            <div className="border-r-1 border-color m-4 pr-10">
              <div>
                <p>
                  <span className="text-xl font-semibold">€93,438</span>
                  <span className="p-1.5 hover:drop-shadow-xl cursor-pointer rounded-full text-white bg-green-400 ml-3 text-xs">
                    23%
                  </span>
                </p>
                <p className="text-gray-500 dark:text-slate-100 mt-1">Budget</p>
              </div>
              <div className="mt-8">
                <p>
                  <span className="text-xl font-semibold">€43,000</span>
                </p>
                <p className="text-gray-500 dark:text-slate-100 mt-1">
                  Expense
                </p>
              </div>
              <div className="mt-5">
                <SparkLine
                  className="mt-10"
                  currentColor={currentColor}
                  id="line-sparkline"
                  type="Line"
                  height="80px"
                  width="250px"
                  data={SparklineAreaData}
                  color={currentColor}
                />
              </div>
              <div className="mt-8">
                <Button
                  color="white"
                  bgColor={currentColor}
                  text="Download Report"
                  size="md"
                  borderRadius="10px"
                />
              </div>
            </div>
            <div>
              <Stacked width="320px" height="360px" />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Ecommerce;
