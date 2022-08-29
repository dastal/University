% clear
clear all;
close all;
clc;

% Parameters
epsilon = 0.0015;

% Use the function written in 1b
n = tolerance_series(epsilon);

% Further Parameters
Ans = zeros(n,0);
xValues = zeros(n,0);
limit = zeros(n,0);

% Compute An
Ans(1) = 1/((2*1-1)^2);
xValues(1) = 1;
limit(1) = (pi^2)/8;

for i = 2:n
    Ans(i)= 1/((2*i-1)^2) + Ans(i-1);
    xValues(i) = i;
    limit(i) = (pi^2)/8;
end

% Plotting
scatter(xValues, Ans);
hold on;
plot(xValues, limit)
title("Exercise 1c");
xlabel("x");
ylabel("Partial Sums");
xlim([min(xValues)-10, max(xValues)+10]);
%ylim([min(Ans)-0.1, max(Ans)+0.1]);
savefig("exercise1c.fig");
close;