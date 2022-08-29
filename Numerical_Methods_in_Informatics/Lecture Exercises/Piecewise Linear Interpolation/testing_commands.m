%% Clearing the Environment
clear all;
close all;
clc;

%% Defining the Problem
% Data Pairs
xx = [3.0 4.5 7.0 9.0]';
yy = [2.5 1.0 2.5 0.5]';

% Desired position of x
x = 5;

% Equidistant data points
xi = (linspace(min(xx),max(xx),61))';

%% Using interp1
y1 = interp1(xx,yy,x,'linear');

% Print the result
fprintf("The approximation at x=%d is y=%f. \n", x, y1);

%% Using interp1q
y2 = interp1q(xx,yy,xi);

plot(xi,y2,"DisplayName","Piecewise Linear Interpolation");
title("Picewise Linear Interpolation Using 'interp1q'");
xlabel("x");
ylabel("y");
legend("Location","best");
grid;
savefig("pw_lin_interp.fig");
close;
