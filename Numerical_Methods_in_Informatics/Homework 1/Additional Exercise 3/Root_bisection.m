% clear
clear all;
close all;
clc;

% Parameters
f1 = @(x) exp(-(x-1).^2)+10*(1-x).^4-4.*x.^3+5;
x0 = 0;
x1 = 2;
epsilon = 10.^(-8);

% Use Bisection function
[x, it] = Bisection(f1, x0, x1, epsilon);

% printing number of iterations
msg = ("The bisection method required " + num2str(it) + " iterations to find the zero of f1 and the zero is located at x = " + num2str(x));
disp(msg);

% computing the x and y Values
xValues = transpose(linspace(-5,5,100));
yValues = f1(xValues);

% plotting
plot(xValues,yValues);
hold on;
scatter(x,f1(x));
title("Plot of f1 with the Zero found with the Bisection Method");
xlabel("x");
ylabel("f1");
legend(["Function", "Zero"], "Location", "best");
savefig("Bisection_f1.fig");
hold off;
close;
