% clear
clear all;
close all;
clc;

% Parameters
partialSums = zeros(10,1);
xValues = zeros(10,1);

% Computing Partial Sums
partialSums(1) = 1/((2*1-1)^2);
xValues(1) = 1;

for i = 2:10
    partialSums(i)= 1/((2*i-1)^2) + partialSums(i-1);
    xValues(i) = i;
end

% Plotting
scatter(xValues, partialSums);
title("David Stalder");
xlabel("x");
ylabel("Partial Sums");
xlim([min(xValues)-0.5, max(xValues)+0.5]);
ylim([min(partialSums)-0.1, max(partialSums)+0.1]);
savefig("series_plot.fig");
close;
