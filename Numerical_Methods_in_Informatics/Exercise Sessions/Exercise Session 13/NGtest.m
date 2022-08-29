%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%           EXERCISE SESSION 13 - Last one...  :'-(
%
%                   EXERCISE 2 : Gauss-Newton method for
%                       Least Square system solving
%
%                   	a. Simple system (2 equations 1 unknown)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Clearing + initialise
clear all; close all; clc;

% Right hand term
b = [15,1.5]'; %theta exact = 3

% Left hand term
f1 = @(theta) theta.^2 + 2;
f2 = @(theta) -2*cos(theta);

% See the vector function and Jacobian in the end of the script

%% Solving using gaussnewton.m
theta0 = 0.1;  % Initial guess
Maxiter = 100; % Maximum number of iteration
tol = 1*10^-5; % Required tolerance
[theta_sol, theta_vec, iter] = Newton_Gauss_param(theta0, b,...
    @Ffun, @Jfun, Maxiter, tol); %

%% Plotting
theta = linspace(-5,5,1000);
hold on
plot(theta,f1(theta),'b-')
plot(theta,b(1)*ones(size(theta)),'c--')
plot(theta,f2(theta),'r-')
plot(theta,b(2)*ones(size(theta)),'m--')
plot(theta_sol,f1(theta_sol),'bo')
plot(theta_sol,f2(theta_sol),'ro')
grid
legend('f_1(x)','b_1','f_2(x)','b_2','sol_1','sol_2','Location','northwest' )


%% Functions definition
function F = Ffun(theta) % Vectorial function
F(1,1) = theta.^2 + 2;
F(2,1) = -2*cos(theta);
end

function J = Jfun(theta) % Jacobian matrix of the vectorial function
J(1,1) = 2*theta;
J(2,1) = 2.*sin(theta);
end

