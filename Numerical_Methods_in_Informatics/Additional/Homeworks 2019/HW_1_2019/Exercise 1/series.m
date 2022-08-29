% clear
clear all;
close all;
clc;

% find first 10 values of series
partialSums = zeros(10, 0);
sum = 0;

for k=1:10
    sum = sum + 1/((2*k-1)^2);
    partialSums(k) = sum;
end

% find x Values
xValues = transpose(linspace(1,10,10));

% plot
plot(xValues, partialSums);
hold on;
title("David Stalder");
xlabel("X Values from 1 to 10");
ylabel("Partial Sums");
savefig("series_plot.fig");
hold off;
close;

