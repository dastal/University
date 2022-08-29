% clear
clear all;
close all;
clc;

% read the csv file
weeklyDataset = csvread('StockPrices.csv',2,0);       % week | price

% Parameters
degrees = [1 2 4];

% Reading Data into x and y vector
xWeekly = weeklyDataset(:,1);
yWeekly = weeklyDataset(:,2);

% 3a Least Squares of weekly dataset
% Coeffictients
leastSquares1Weekly= polyfit(xWeekly,yWeekly,degrees(1));
leastSquares2Weekly= polyfit(xWeekly,yWeekly,degrees(2));
leastSquares4Weekly= polyfit(xWeekly,yWeekly,degrees(3));

yLeastSquares1Weekly = polyval(leastSquares1Weekly, xWeekly);
yLeastSquares2Weekly = polyval(leastSquares2Weekly, xWeekly);
yLeastSquares4Weekly = polyval(leastSquares4Weekly, xWeekly);

% 3b cubic spline of weekly dataset
splineWeekly = spline(xWeekly,yWeekly);
nodes = linspace(1,xWeekly(end),500);
ySplineWeekly = ppval(splineWeekly, nodes);

% plotting
plot(xWeekly*7, yLeastSquares1Weekly);
hold on;
plot(xWeekly*7, yLeastSquares2Weekly);
plot(xWeekly*7, yLeastSquares4Weekly);
plot(nodes*7, ySplineWeekly);
scatter(xWeekly*7, yWeekly);
title("Weekly Stock Prices");
xlabel("Week");
ylabel("Price");
legend(["LS deg. 1", "LS deg. 2", "LS deg. 4", "Cubic Spline", "Actual Values"], "Location", "best");
savefig("stock_prices_weekly.fig");
hold off;
close;

% Maximum residual
max_er1=max((yLeastSquares1Weekly-yWeekly).^2);
max_er2=max((yLeastSquares2Weekly-yWeekly).^2);
max_er4=max((yLeastSquares4Weekly-yWeekly).^2);

fprintf("Maximum square residual (weekly):\n")
fprintf("   Degree 1: %.2f\n",max_er1)
fprintf("   Degree 2: %.2f\n",max_er2)
fprintf("   Degree 4: %.2f\n\n",max_er4)

% Sum of the square
er1=sum((yLeastSquares1Weekly-yWeekly).^2);
er2=sum((yLeastSquares2Weekly-yWeekly).^2);
er4=sum((yLeastSquares4Weekly-yWeekly).^2);

fprintf("Sum of the square of the residual (weekly):\n")
fprintf("   Degree 1: %.2f\n",er1)
fprintf("   Degree 2: %.2f\n",er2)
fprintf("   Degree 4: %.2f\n",er4)
% Higher order better