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

const DropDown = ({ currentMode }) => (
  <div className="w-28 border-1 border-color px-2 py-1 rounded-md">
    <DropDownListComponent
      id="time"
      fields={{ text: "Time", value: "Id" }}
      style={{ border: "none", color: currentMode === "Dark" && "white" }}
      value="1"
      dataSource={dropdownData}
      popupHeight="220px"
      popupWidth="120px"
    />
  </div>
);

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
          {/* Revenue Updates chart */}
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

        {/* Earning */}
        <div>
          <div
            className="rounded-2xl md:w-400 p-4 m-3 shadow"
            style={{ backgroundColor: currentColor }}
          >
            <div className="flex justify-between items-center ">
              <p className="font-semibold text-white text-2xl">Earnings</p>

              <div>
                <p className="text-2xl text-white font-semibold mt-8">
                  $300,000
                </p>
                <p className="text-gray-200">Monthly revenue</p>
              </div>
            </div>
            <div className="mt-4">
              <SparkLine
                currentColor={currentColor}
                id="column-sparkLine"
                height="100px"
                type="Column"
                data={SparklineAreaData}
                width="320"
                color="rgb(242, 252, 253)"
              />
            </div>
          </div>
        </div>

        {/* Yearly sales Pie chart */}
        <div className="bg-white dark:text-gray-200 dark:bg-main-dark-bg rounded-2xl md:w-72 p-3 m-3 flex justify-center items-center gap-2 shadow">
          <div>
            <p className="text-2xl font-semibold ">$43,246</p>
            <p className="text-gray-400">Yearly sales</p>
            <div className="w-40">
              <Pie
                id="pie-chart"
                data={ecomPieChartData}
                legendVisiblity={false}
                height="160px"
              />
            </div>
          </div>
        </div>

        {/* Recent Transactions */}

        <div className="flex gap-10 m-4 flex-wrap justify-center shadow">
          <div className="bg-white dark:text-gray-200 dark:bg-secondary-dark-bg p-6 rounded-2xl">
            <div className="flex justify-between items-center gap-2">
              <p className="text-xl font-semibold">Recent Transactions</p>
              <DropDown currentMode={currentMode} />
            </div>
            <div className="mt-10 w-72 md:w-400">
              {recentTransactions.map((item) => (
                <div key={item.title} className="flex justify-between mt-4">
                  <div className="flex gap-4">
                    <button
                      type="button"
                      style={{
                        color: item.iconColor,
                        backgroundColor: item.iconBg,
                      }}
                      className="text-2xl rounded-lg p-4 hover:drop-shadow-xl"
                    >
                      {item.icon}
                    </button>
                    <div>
                      <p className="text-md font-semibold">{item.title}</p>
                      <p className="text-sm text-gray-400">{item.desc}</p>
                    </div>
                  </div>
                  <p className={`text-${item.pcColor}`}>{item.amount}</p>
                </div>
              ))}
            </div>
            <div className="flex justify-between items-center mt-5 border-t-1 border-color">
              <div className="mt-3">
                <Button
                  color="white"
                  bgColor={currentColor}
                  text="Add"
                  borderRadius="10px"
                />
              </div>

              <p className="text-gray-400 text-sm">36 Recent Transactions</p>
            </div>
          </div>

          {/* Sales Overview line chart */}
          <div className="bg-white dark:text-gray-200 dark:bg-secondary-dark-bg p-6 rounded-2xl w-96 md:w-760 shadow">
            <div className="flex justify-between items-center gap-2 mb-10">
              <p className="text-xl font-semibold">Sales Overview</p>
              <DropDown currentMode={currentMode} />
            </div>
            <div className="md:w-full overflow-auto">
              <LineChart />
            </div>
          </div>
        </div>

        <div className="flex flex-wrap justify-center shadow">
          <div className="md:w-400 bg-white dark:text-gray-200 dark:bg-secondary-dark-bg rounded-2xl p-6 m-3">
            <div className="flex justify-between">
              <p className="text-xl font-semibold">Weekly Stats</p>
              <button
                type="button"
                className="text-xl font-semibold text-gray-500"
              >
                <IoIosMore />
              </button>
            </div>

            <div className="mt-10 ">
              {weeklyStats.map((item) => (
                <div
                  key={item.title}
                  className="flex justify-between mt-4 w-full"
                >
                  <div className="flex gap-4">
                    <button
                      type="button"
                      style={{ background: item.iconBg }}
                      className="text-2xl hover:drop-shadow-xl text-white rounded-full p-3"
                    >
                      {item.icon}
                    </button>
                    <div>
                      <p className="text-md font-semibold">{item.title}</p>
                      <p className="text-sm text-gray-400">{item.desc}</p>
                    </div>
                  </div>

                  <p className={`text-${item.pcColor}`}>{item.amount}</p>
                </div>
              ))}
              <div className="mt-4">
                <SparkLine
                  currentColor={currentColor}
                  id="area-sparkLine"
                  height="160px"
                  type="Area"
                  data={SparklineAreaData}
                  width="320"
                  color="rgb(242, 252, 253)"
                />
              </div>
            </div>
          </div>
          <div className="w-400 bg-white dark:text-gray-200 dark:bg-secondary-dark-bg rounded-2xl p-6 m-3">
            <div className="flex justify-between">
              <p className="text-xl font-semibold">MedicalPro Branding</p>
              <button
                type="button"
                className="text-xl font-semibold text-gray-400"
              >
                <IoIosMore />
              </button>
            </div>
            <p className="text-xs cursor-pointer hover:drop-shadow-xl font-semibold rounded-lg w-24 bg-orange-400 py-0.5 px-2 text-gray-200 mt-10">
              16 Aug, 2022
            </p>

            <div className="flex gap-4 border-b-1 border-color mt-6">
              {medicalproBranding.data.map((item) => (
                <div
                  key={item.title}
                  className="border-r-1 border-color pr-4 pb-2"
                >
                  <p className="text-xs text-gray-400">{item.title}</p>
                  <p className="text-sm">{item.desc}</p>
                </div>
              ))}
            </div>
            <div className="border-b-1 border-color pb-4 mt-2">
              <p className="text-md font-semibold mb-2">Teams</p>

              <div className="flex gap-4">
                {medicalproBranding.teams.map((item) => (
                  <p
                    key={item.name}
                    style={{ background: item.color }}
                    className="cursor-pointer hover:drop-shadow-xl text-white py-0.5 px-3 rounded-lg text-xs"
                  >
                    {item.name}
                  </p>
                ))}
              </div>
            </div>
            <div className="mt-2">
              <p className="text-md font-semibold mb-2">Leaders</p>
              <div className="flex gap-4">
                {medicalproBranding.leaders.map((item, index) => (
                  <img
                    key={index}
                    className="rounded-full w-8 h-8"
                    src={item.image}
                    alt=""
                  />
                ))}
              </div>
            </div>
            <div className="flex justify-between items-center mt-5 border-t-1 border-color">
              <div className="mt-3">
                <Button
                  color="white"
                  bgColor={currentColor}
                  text="Add"
                  borderRadius="10px"
                />
              </div>

              <p className="text-gray-400 text-sm">36 Recent Transactions</p>
            </div>
          </div>
          <div className="w-400 bg-white dark:text-gray-200 dark:bg-secondary-dark-bg rounded-2xl p-6 m-3">
            <div className="flex justify-between">
              <p className="text-xl font-semibold">Daily Activities</p>
              <button
                type="button"
                className="text-xl font-semibold text-gray-500"
              >
                <IoIosMore />
              </button>
            </div>
            <div className="mt-10">
              <img className="md:w-96 h-50 " src={product9} alt="" />
              <div className="mt-8">
                <p className="font-semibold text-lg">React 18 Features</p>
                <p className="text-gray-400 ">By Johnathan Doe</p>
                <p className="mt-8 text-sm text-gray-400">
                  This will be the small description for the news you have shown
                  here. There could be some great info.
                </p>
                <div className="mt-3">
                  <Button
                    color="white"
                    bgColor={currentColor}
                    text="Read More"
                    borderRadius="10px"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Ecommerce;
