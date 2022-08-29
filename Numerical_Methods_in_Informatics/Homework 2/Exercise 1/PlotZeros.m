% clear
clear all;
close all;
clc;

% Parameters
f1 = @(x) x.^2-9;
df1 = @(x) 2.*x;
x0 = 0.1;
f2 = @(x) (x-4).^2;
df2 = @(x) 2.*(x-4);
f3 = @(x) tanh(x);
df3 = @(x) 1-tanh(x).^2;
x03 = 2.0;
epsilon = 5*10^-9;
itMax = 1000;
a = -2;
b = 5;

% Function calls
[x1, r1, it1, xxs1] = NewtonMeth(f1, df1, x0, itMax, epsilon);
[x2, r2, it2, xxs2] = NewtonMeth(f2, df2, x0, itMax, epsilon);
[x3, r3, it3, xxs3] = NewtonMeth(f3, df3, x03, itMax, epsilon);

% Computing the function values
xValues = linspace(a,b,1000);
y1Values = f1(xValues);
y2Values = f2(xValues);
y3Values = f3(xValues);

% Line on x-axis
yValues = zeros(length(xValues));

% Plot
plot(xValues, y1Values, 'b');
hold on;
plot(xValues, y2Values, 'r');
plot(xValues, y3Values);
plot(xValues, yValues, 'k');
scatter(x1, f1(x1), 'b');
scatter(x2, f2(x2), 'r');
scatter(x3, f3(x3));
xlabel("x");
ylabel("Function Values");
title("Newton Method");
legend(["f1", "f2", "f3", "x-axis", "x1", "x2"]);
savefig("FoundZeros.fig");
hold off;
close;
