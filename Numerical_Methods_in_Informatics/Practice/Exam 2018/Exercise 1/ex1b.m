%% Clear the Environment
clear all;
close all;
clc;

%% Defining the Problem
% Function
f = @(x) exp(-25*x.^2);

% Nodes
x = [-1.0 -0.75 -0.5 -0.25 0];

% Function Values
y = f(x);

% Exact Value
x_bar = 0.4;

% Y value of exact Value
y_bar = f(x_bar);

%% Degree 2
% Degree
n2 = 2;

% Choose next 3 nodes to x_bar
xx2 = [-0.75 -0.5 -0.25];

% Compute f(x)
yy2 = f(xx2);

% Polynomial Interpolation
p2 = polyfit(xx2,yy2,n2);
y2 = polyval(p2,x_bar);
error2 = abs(y2-y_bar);

fprintf("P_2 f(x) = %.2f x^2 + %.2f x + %.2f \n", p2(1), p2(2), p2(3));
fprintf("Error at x_bar=0.4: %f \n\n", error2);

%% Degree 3
% Degree
n3 = 3;

% Choose next 3 nodes to x_bar
xx3 = [-0.75 -0.5 -0.25 0];

% Compute f(x)
yy3 = f(xx3);

% Polynomial Interpolation
p3 = polyfit(xx3,yy3,n3);
y3 = polyval(p3,x_bar);
error3 = abs(y3-y_bar);

fprintf("P_2 f(x) = %.2f x^3 + %.2f x^2 + %.2f x + %.2f \n", p3(1), p3(2), p3(3), p3(4));
fprintf("Error at x_bar=0.4: %f \n", error3);