%% Clearing the Environment
clear all;
close all;
clc;

%% Defining the Problem
% Matrix A
A = [3 -1 2;
    0 5 -4;
    -1 -1 3];

% Vector b
b = [-1 2 3]';

% Intial guess
x0 = [-1 1 1]';

% Tolerance
tol = 0.01;

%% Apply gauss Seidel
[xgs,itgs] = gaussSeidel(A,b,x0,tol,1000);

%% Results
res = b-A*xgs;
fprintf(' Gauss-Seidel solution\n');
fprintf(' x_1=%8.4f\n', xgs(1));
fprintf(' x_2=%8.4f\n', xgs(2));
fprintf(' x_3=%8.4f\n', xgs(3));
fprintf(' iter performed: %d\n',itgs);
fprintf(' res= %8.5f\n\n',norm(res, Inf));

%% Function for Gauss-Seidel
function [x,it] = gaussSeidel(A,b,x0,tol,itMax)
    P = tril(A);
    x=x0;
    r = b-A*x;
    xp =x0;
    it =0; err=tol+1;
    while (err>tol && it<itMax)
        z = P\r;
        x = x +z;
        r = b-A*x;
        err = norm(x-xp,2);
        xp = x; it =it +1;
    end
    if(it==itMax && err >tol)
        fprintf('Error, Gauss-Seidel NOT converged!\n');
    end
end
