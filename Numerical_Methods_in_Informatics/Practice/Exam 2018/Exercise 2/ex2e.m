%% Clear the environment
close all;
clear all;
clc;

%% Define the Problem
% Matrix A
A = [3 -1 2;
    0 5 -4;
    -1 -1 3];

% Vector b
b = [-1 2 3]';

% Initial Guess
x0 = [-1,1,1]';

% Tolerance
tol = 0.01;

% Maximum iterations
Nmax = 500;

%% Applying Gauss-Seidel
[x,xxs,it] = gaussSeidel(A,b,x0,tol,Nmax);
