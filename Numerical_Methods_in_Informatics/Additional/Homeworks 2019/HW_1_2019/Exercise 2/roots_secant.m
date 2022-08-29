% clear
clear all;
close all;
clc;

% Parameters
f1 = @(x) 2.*cos(3.*x)-exp(x);

% first Test
x01 = 0.1;
x11 = 0.11;
convergence1 = 10^(-8);
[x1, it1] = secantmethod(f1,x01,x11,convergence1);

% second Test
x02 = -1;
x12 = -0.9;
convergence2 = 10^(-5);
[x2, it2] = secantmethod(f1,x02,x12,convergence1);

% computing x and y values
xValues = transpose(linspace(-5,5,1000));
yValues = f1(xValues);

% plottin
plot(xValues,yValues);
hold on;
scatter(x1,f1(x1));
scatter(x2,f1(x2));
legend(["Function", "Result of First Test", "Result of Second Test"], "Location", "Southwest");
title("Secant Method");
xlabel("X Values -5<=x<=5");
ylabel("F1");
savefig("secantMethodFigure.fig");
hold off;
close;
