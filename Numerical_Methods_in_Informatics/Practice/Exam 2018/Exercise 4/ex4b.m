%% Clear the Environment
clear all;
close all;
clc;

%% Defining the Problem
% Function
f = @(x) 2*sin(x)*(x^2)/10;

% Interval
a = -4;
b = 0;

% Initial value
x0 = (a+b)/2;

% Tolerance
tol = 0.001;

%% Apply the Newton Method for Optimization
[x,it] = Newton_Method_Optimization(x0,tol);

