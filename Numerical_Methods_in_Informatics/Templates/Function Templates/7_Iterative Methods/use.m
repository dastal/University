%% Clearing Environment
clear all;
close all;
clc;

%% Parameters
% Tolerance
tol = 10^-6;

% Maximum iterations
Nmax = 1000;

% Build sparse matrix A
n = 50;
e = ones(n,3);
% A = full(spdiags([e 2.001*e e],-1:1,n,n)); %-> full matrix
e(:,2) = 2.001;
A = spdiags(e,-1:1,n,n);        % saves a lot of space

% Compute b
xex = transpose(linspace(1,1,n));
b = A*xex;

% Compute intial guess x0
x0 = transpose(10.*sin(100.*[1:n]));

%% Execute the Gauss-Seidel Method
% first call of gaussSeidel with stopCr=0
%[xxs0,it0] = Gauss_Seidel_Vectorwise(A,b,x0,tol,Nmax,stopCr);
%[xxs,it] = Jacoby_Vectorwise(A,b,x0,tol,Nmax);

[xxs1,it1] = Gauss_Seidel_Componentwise(A,b,x0,tol);
[xxs2,it2] = Jacoby_Componentwise(A,b,x0,tol);



