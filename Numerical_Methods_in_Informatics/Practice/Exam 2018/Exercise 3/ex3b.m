%% Clear the environment
close all;
clear all;
clc;

%% Define the Problem
% Funtion
f = @(x) x^(5/2);

% Interval
a = 1;
b = 2;

%% Applying Composite Simpson
% Step length 0.5
Ic05 = comp_simpson(f, a, b, 2);

fprintf("The result of the composite Simpson formula with step length 0.5 is Ic=%.6f \n",Ic05);

% Step length 0.25
Ic025 = comp_simpson(f, a, b, 4);

fprintf("The result of the composite Simpson formula with step length 0.25 is Ic=%.6f \n",Ic025);

%% Part b2)
% Iex
Iex = (16*sqrt(2)-2)/7;

% Compute the errors
err05 = abs(Iex-Ic05);
err025 = abs(Iex-Ic025);

% Estimate the order of convergence
h = [0.25 0.5];
errs = [err025 err05];

% Plot the errors
plot(h,errs,"DisplayName","Computed Simpson");
hold on
legend("location","Northwest");
grid;
title("Estimate the Order of Convergence");
xlabel("H");
ylabel("Error");
savefig("conv_est.fig");
hold off;
close;
