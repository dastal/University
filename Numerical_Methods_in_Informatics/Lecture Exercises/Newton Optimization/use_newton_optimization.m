
% Init
clc
clear all;
close all;


% Function to minize 
f = @(x1,x2) x1^2 + x2^4 + 1; 

% Gradient of f
G = @(x1,x2) [2*x1; 4*x2^3];   % Columnvector, 1. der. of x1, x2 , ... 

% Hessian Matrix of f
H = @(x1,x2) [2, 0; 0, 12*x2^2]; % Matrix, 2. der. of x1 in first column 


x0=[0.1;0.1]; % Initial guess
tol=1e-8;          % Tolerance

[x,res,niter]=newton_optimization(G,H,x0,tol,1000);

if norm(res)<1e-5
    disp("Solution found:")
    disp(x')
    fprintf("Within %d iterations.\n",niter)
end