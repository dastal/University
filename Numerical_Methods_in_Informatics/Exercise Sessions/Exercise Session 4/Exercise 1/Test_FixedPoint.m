%% Clearing the environment
clear all;
close all;
clc;

%% Parameters
% Define the Interval to be tested
a = 0;
b = 1.4;

% Maximum iterations
itMax = 50;

% Function
f = @(x) exp(-x)-x;

% Iteration Function
g = @(x) exp(-x);

%% Fixed-point iteration
% Use the function
xs = Fixed_Point(g,a,b,itMax);

%% Plotting the interation process

xx = linspace(a,b,100);
hold on;
plot(xx,f(xx));
plot(xx,g(xx),"--k");
plot(xx,xx,"--r");
xlabel('x');
ylabel('y');
% legend('f','g','x','location','best');    % The legend will not be shown
% here because if it would, in the next step every data point would be
% listed separately.

% Draw the iteration process step by step
for k=1:length(xs)
   plot(xs(k),g(xs(k)),"+")
   pause(2./k)
end

title("Fixed Point Iteration Process");
savefig("iteration_process.fig");
hold on;
close;

%% Inform the user if not converged
tol = 1e-8;
if(f(xs(end))>tol)
    fprintf("The given number of iterations did not allow us to find the zero with the wished accuracy. x=%f, tol=%e \n", xs(end), f(xs(end)));
else
    fprintf("The zero was found within %d iterations. The approximated zero is x=%f with a f(x) value of tol=%e. \n", length(xs), xs(end), f(xs(end)));
end

%% Answer to convergence
% We can find L<1 for which the Banach Fixed point Theorem is fulfilled, or
% |rho'(alpha)|<1. Therefore the convergence is linear!
