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

%% LU Factorization
[L, U, cL, cU] = GetLU(A);

%% Solve by Substitution
x = Substitution(L,U,b);

disp(x);