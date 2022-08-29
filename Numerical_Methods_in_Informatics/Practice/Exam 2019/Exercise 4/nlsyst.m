%% Clearing the Environment
clear all;
close all;
clc;

%% Defining the Problem
% Initial guess
x0 = [0, 0.5]';

% Tolerance
tol = 1e-8;

itMax = 100;

%% Call the function
[x, it, NPiv, res] = newtonMeth(@fun, @jac, x0, tol, itMax);

%% print the inf norm of the residual at the last iteration
fprintf("The inf-norm of the residual at the last iteration is: %f \n", norm(res,inf));

%% Function handle for f
function F = fun(x)
    F(1,1) = (x(1)+3)*(x(2)^3-7)+13;
    F(2,1) = 30*sin(x(2)*cos(x(1))-1);
end

%% Function handle for Jacobi Matrix
function J = jac(x)
    J(1,1) = x(2)^3-7;
    J(1,2) = 3*(x(1)+3)*x(2)^2;
    J(2,1) = -30*sin(x(1))*cos(x(2)*cos(x(1))-1);
    J(2,2) = 30*cos(x(2))*cos(cos(x(2))*x(1)-1);
end