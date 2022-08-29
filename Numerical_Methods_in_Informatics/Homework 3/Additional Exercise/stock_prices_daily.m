% clear
clear all;
close all;
clc;

% read the csv file
dailyDataset = csvread('StockPrices_day.csv',2,0);     % day | price

% Parameters
degrees = [1 2 4];

% Reading Data into x and y vector
xDaily = dailyDataset(:,1);
yDaily = dailyDataset(:,2);

% 3a Least Squares of weekly dataset
% Coeffitients
leastSquares1Daily= polyfit(xDaily,yDaily,degrees(1));
leastSquares2Daily= polyfit(xDaily,yDaily,degrees(2));
leastSquares4Daily= polyfit(xDaily,yDaily,degrees(3));

yleastSquares1Daily = polyval(leastSquares1Daily, xDaily);
yleastSquares2Daily = polyval(leastSquares2Daily, xDaily);
yleastSquares4Daily = polyval(leastSquares4Daily, xDaily);

% 3b cubic spline of weekly dataset
splineDaily = spline(xDaily,yDaily);
nodes = linspace(1,xDaily(end),500);
ySplineDaily = ppval(splineDaily, nodes);

% plotting
plot(xDaily*7, yleastSquares1Daily);
hold on;
plot(xDaily*7, yleastSquares2Daily);
plot(xDaily*7, yleastSquares4Daily);
plot(nodes*7, ySplineDaily);
scatter(xDaily*7, yDaily);
title("Daily Stock Prices");
xlabel("Day");
ylabel("Price");
legend(["LS deg. 1", "LS deg. 2", "LS deg. 4", "Cubic Spline", "Actual Values"], "Location", "best");
savefig("stock_prices_daily.fig");
hold off;
close;