% HOMEWORK 6 - EXERCISE 2 (b), (c)

%% Initialisation 
clear all; close all; clc;


n = 40; 
tau = 4 * (n+1)^2/pi^2;

tol = 1.0e-10;
maxit = 2500;

% Construction of the matrix
Tn = 2*eye(n) - diag(ones(n-1,1),-1) - diag(ones(n-1,1),1);
Tn = (((n+1)/pi)^2)*Tn;

% Initial guess

x0 = [1:n]';

%% Computation of the lowest eigenvalue with pwershift function (b)

[lambda_1, x1, iter, lambdas_1] = powershift(Tn,tau, tol, maxit, x0);   %%%%%% Insert Method here <======

% compare with theoretical value
exact_lambda_l=(2-2*cos(pi/(n+1))) * ((n+1)/pi)^2;

errors = abs(lambdas_1 - exact_lambda_l);

% Compute the convergence
exact_lambda_2 = (2-2*cos(2 * pi/(n+1))) * ((n+1)/pi)^2;

% Ratio
rat = (exact_lambda_2 - tau) / (exact_lambda_l- tau);

%% Plotting

figure();
semilogy(errors,'b', 'DisplayName', 'Error on the Eigenvalue')
hold on
semilogy(rat.^(2*[1:iter]),'b:', 'DisplayName', 'Expected convergence for \lambda')
title("Error on the Eigenvlaue along he iteration");
xlabel ("Iteration k"),
ylabel("Error on \lambda_1^{(k)}")
grid
legend()