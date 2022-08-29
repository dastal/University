%% Clearing the Environment
clear all;
close all;
clc;

%% Defining the Problem
% nodes
nodes = [-1.0 -0.75 -0.5 -0.25 0];

% Function
f = @(x) exp(-25.*x.^2);

% Exact y values
yy = f(nodes);

% x bar -> approximate value at this point
x_bar = -0.4;

% Exact y value for x_bar
y_bar = f(x_bar);

%% Interpolating polynomial of degree 2
% degree
n2 = 2;

% Choose the appropriate interval -> [-0.75 -0.5 -0.25]
nodes2 = nodes(2:4);

% Display the selected nodes
disp("Selected nodes for n=2:");
disp("nodes =");
disp(nodes2');

% Compute the exact y values
yy2 = f(nodes2);

p2 = polyfit(nodes2,yy2,n2);
y2 = polyval(p2,x_bar);
error2 = abs(y2-y_bar);

fprintf("P_2 f(x) = %.2f x^2 + %.2f x + %.2f \n", p2(1), p2(2), p2(3));
fprintf("Error at x_bar=0.4: %f \n", error2);
fprintf("Exact value at f(x_bar): %f \n\n", y2);

%% Interpolating polynomial of degree 3
% degree
n3 = 3;

% Choose the appropriate interval -> [-0.75 -0.5 -0.25 0]
nodes3 = nodes(2:end);

% Display the selected nodes
disp("Selected nodes for n=3:");
disp("nodes =");
disp(nodes3');

% Compute the exact y values
yy3 = f(nodes3);

p3 = polyfit(nodes3,yy3,n3);
y3 = polyval(p3,x_bar);
error3 = abs(y3-y_bar);

fprintf("P_2 f(x) = %.2f x^3 + %.2f x^2 + %.2f x + %.2f \n", p3(1), p3(2), p3(3), p3(4));
fprintf("Error at x_bar=0.4: %f \n", error3);
fprintf("Exact value at f(x_bar): %f \n\n", y3);
