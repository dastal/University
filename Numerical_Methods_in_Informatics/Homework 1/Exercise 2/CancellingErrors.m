% clear
clear all;
close all;
clc;

% Parameters
f1 = @(x) (1-cos(x))./(x.^2);
f2 = @(x) (2.*sin(x./2).^2)./(x.^2);
h = 10.^[-16, -8, -5, -4, -3, -1];

% computing the function values
fun1 = f1(h);
fun2 = f2(h);

% plotting
plot(log(h), f1(h), '--*');
hold on;
plot(log(h), f2(h), '-o');
xlabel("log(h)");
ylabel("Function Values");
title("Comparison of Two Algebraically Equivalent Functions");
legend(["f1","f2"], "Location", "Southeast");
savefig("ComputationError.fig");
close;

% Additional Point
% How do you explain the observed behavior?
% Because the cosine of very small numbers is even smaller and such numbers
% are rounded by matlab.