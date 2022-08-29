% clear
clear all;
close all;
clc;

% Paraneters
epsilon = 0.0015;

% find out the first n such that |An-A|<=epsilon
n = tolerance_series(epsilon);
Ans = zeros(n,1);
xValues = zeros(n,1);
As = zeros(n,1);
sum = 0;

for i=1:n
    sum = sum + 1/(((2 * i) - 1)^2);
    Ans(i) = sum;
    xValues(i) = i;
    As(i) = pi^2/8;
end

% plotting
plot(xValues,Ans);
hold on
plot(xValues, As);
title("Partial Sums and Convergence");
xlabel("x Values");
ylabel("Partial Sums/ Convergence");
xlim([min(xValues) max(xValues)]);
legend(["Partial Sums", "Convergece"], "Location", "Southeast");
savefig("convergence.fig");
hold off;
close;
