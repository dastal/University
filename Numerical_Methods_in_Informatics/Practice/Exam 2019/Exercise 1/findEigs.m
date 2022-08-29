%% Clear the Environment
clear all;
close all;
clc;

%% Defining the Problem
% Initialize a
a = linspace(-2,2,500);

% Initial guess
x0 = [1 1 1]';

% Maximum iterations
itMax = 500;

% tolerance
tol = 1e-8;

% Initialize storage vectors for eignevalues and number of iterations
eigenvalues = zeros(length(a),1);
iterations = zeros(length(a),1);

%% Applying the inverse power method
for i=1:length(a)
   A = [a(i) 1 1;
       1 3 -1;
       1 -1 2];
   [eigenvalues(i), iterations(i), err] = inversePower(A,x0,itMax,tol);
end

%% Plotting
% Plot 1: minimum eigenvalueswith respect to a

plot(a,eigenvalues);
hold on;
xlabel("a");
ylabel("Minimum Eigenvalue");
title("Minimum Eigenvalues with Respect to a");
savefig("eigenvalues.fig");
hold off;
close;

% Plot 2: iterations are with respect to a
plot(a,iterations);
hold on;
xlabel("a");
ylabel("Iteration");
title("Iteration with Respect to a");
savefig("iterations.fig");
hold off;
close;

%% Part c: Method did not converge for a = 1.35
A = [-1.35 1 1;
       1 3 -1;
       1 -1 2];

% Apply inverse Power method
[min_eig, iter, err] = inversePower(A,x0,itMax,tol);

% Compute the exact eigenvalue
e = eig(A);

% Print it
disp("The eigenvalues of A with a = 1.35 are:");
disp(e);

% Print eigenvalue
fprintf("For the value of a = 1.35, the inverse power method did not converge with the error %f and computed minimum eigenvalue lambda_min=%f", err,min_eig);