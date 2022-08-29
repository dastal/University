%% Clearing the Environment
clear all;
close all;
clc;

%% Defining the Problem
% Create Matrix C
C = zeros(3,3);

for i=1:3
   for j=1:3
       C(i,j) = i+j;
   end
end

% Create the matrix A
A = eye(3)-C;

% Create the correct iteration matrix
A = A'*A;

% Define the vector b
b = [-44,-57,-80]';
b = A'*b;

% Initial guess
x0 = zeros(3,1);

% Tolerance
tol = 1e-8;

%% Applying the Gauss-Seidel Mehtod
[x,it] = itermeth(A,b,x0,tol);
