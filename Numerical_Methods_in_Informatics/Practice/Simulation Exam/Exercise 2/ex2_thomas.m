%% Clearing the Environment
clear all;
close all;
clc;

%% Part b: generate the plot
% complexity Thomas algorithm
compT = @(n) 8*n-7;

% complexity Gauss Elimination and Backward Substitution
compG = @(n) 2/3*n.^3+3/2*n.^2-7/6*n;

% n from 2 to 30
ns = [2:30];

% Plot
loglog(ns,compT(ns), "b", "DisplayName", "Thomas Algorithm");
hold on;
loglog(ns, compG(ns), "r", "DisplayName", "Gauss Elimination");
grid;
legend("location","northwest");
title("Number of Operations to solve Ax=b");
xlabel("n");
ylabel("Number of Operations");
savefig("num_ops.fig");
hold off;
close;

%% Part c: Thomas Algorithm
% Building Martix A
n = 5;
A = 2.04*eye(n)-diag(ones(n-1,1),1)-diag(ones(n-1,1),-1);

% Building vector b
b = [20.8 0.8 0.8 0.8 100.8]';

% LU fatorization in Thomas algorithm
alphas = zeros(n,1);
betas = zeros(n,1);

a = diag(A);
e = [0 diag(A,-1)']';
c = diag(A,1);

alphas(1) = a(1);

for i=2:n
    betas(i) = e(i)/alphas(i-1);
    alphas(i) = a(i)-betas(i)*c(i-1);
end

% Forward Substitution
ys = zeros(n,1);

ys(1) = b(1);

for i=2:n
   ys(i) = b(i)-betas(i)*ys(i-1); 
end

% Backward Substitution
xs = zeros(n,1);

xs(n) = ys(n)/alphas(n);

for i=(n-1):-1:1
   xs(i) = (ys(i)-c(i)*xs(i+1))/alphas(i);
end

% Printing the solution
fprintf("The solution is: \n")
for i=1:n
    fprintf(" %.4f \n",xs(i))
end
