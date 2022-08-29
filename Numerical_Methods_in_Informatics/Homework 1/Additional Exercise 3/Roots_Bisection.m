% clear
clear all;
close all;
clc;

% Parameters
f2 = @(x) 2*cos(3*x)-exp(x);
x0 = 0;
x1 = 2;
epsilon = 10.^(-8);

% Use Bisection function
[x, it] = Bisection(f2, x0, x1, epsilon);

% printing number of iterations
msg = ("The bisection method required " + num2str(it) + " iterations to find the zero of f1 and the zero is located at x = " + num2str(x));
disp(msg);

% computing the x and y Values
xValues = transpose(linspace(-5,5,100));
yValues = f2(xValues);

% plotting
plot(xValues,yValues);
hold on;
scatter(x,f2(x));
title("Plot of f2 with the Zero found with the Bisection Method");
xlabel("x");
ylabel("f2");
legend(["Function", "Zero"], "Location", "best");
savefig("Bisection_f2.fig");
hold off;
% close;

% Observation: We miss a lot of roots since the function is not monotoneous
% and the Bisection Method only finds one zero at a time. If we would
% specify the interval differently, we would find also the other zeros of
% the function.
