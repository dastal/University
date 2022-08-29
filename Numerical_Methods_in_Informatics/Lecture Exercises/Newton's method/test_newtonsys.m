%% Clear the environment
clear all;
close all;
clc;

%% Parameters
% Intialize xa0 = x0
x0 = [-1, 1];
x0 = x0';

% Intialize tolerance
tol = 1e-5;

% Initialize maximum iteration steps
nmax = 1000;

%% Call the function
[x, res, niter] = newtonsys(@fun, @jac, x0, tol, nmax);

disp("x = ");
disp(x);

%% Function handle for f
function F = fun(x)
    F(1,1) = x(1)^2 + x(2)^2 - 1;
    F(2,1) = x(1)^2 - 2*x(1) - x(2) + 1;
end

%% Function handle for Jacobi Matrix
function J = jac(x)
    J(1,1) = 2*x(1);
    J(1,2) = 2*x(2);
    J(2,1) = 2*x(1) - 2;
    J(2,2) = -1;
end
