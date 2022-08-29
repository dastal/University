% unless the exercise does not explicitly say that there is a need for a
% script, I created it to conduct the calculatios

% clear
clear all;
close all;
clc;

% Parameters
f = @(x) cos(x);
x = transpose(linspace(0,1,101));
yValues = f(x);
nodes = [0 0.6 0.9];
yNodes = f(nodes);

% Lagrangian
[res,err] = lagr_polynomial(x);

% plotting
plot(x,yValues);
hold on;
plot(x,res(:,1));
plot(x,res(:,2));
plot(x,res(:,3));
plot(x,res(:,4));
scatter(nodes,yNodes, 'square', 'r', 'LineWidth', 2);
title("Lagrangian Form");
legend(["Function", "First Polynomial", "Second Polynomial", "Third Polynomial", "Lagrangian Form", "Original Nodes"], "Location", "Southwest");
xlabel("x");
ylabel("y");
ylim([-1.3 1.5]);
savefig("lagrangianpoly.fig");
hold off;
close;

% printing actual error to the screen
msg = ("The actual error at each of the " + num2str(length(x)) + " points:");
disp(msg);
disp(err);