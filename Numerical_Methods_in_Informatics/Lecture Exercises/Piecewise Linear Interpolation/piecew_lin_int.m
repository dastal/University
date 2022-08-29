%% Clearing the Environment
clear all;
close all;
clc;

%% Defining the Problem
% Data Pairs
xx = [3.0 4.5 7.0 9.0];
yy = [2.5 1.0 2.5 0.5];

% Desired position of x
x = 5;

% Find the index of the interval where x lies
i = findIndex(x,xx);

%% Piecewise Linear Interpolation
% Approximation at x = 5
s_i_x = 1+((yy(i+1)-yy(i))/(xx(i+1)-xx(i)))*(x-xx(i));

% Print the result
fprintf("The approximation at x=%d is y=%f. \n",x,s_i_x);

%% Function for finding the index of interval where x = 5 lies
function [i] = findIndex(x,xx)
    % Check if x is in the interval
    if x<min(xx) || x>max(xx)
        error("x is not in the given interval!");
    end

    % Find the interval
    for k=1:length(xx)-1
        if (x>xx(k)) && (x<xx(k+1))
            i = k;
        end
    end
end
