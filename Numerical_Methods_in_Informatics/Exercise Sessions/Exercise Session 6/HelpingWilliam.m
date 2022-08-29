%{
        Script that helps william to build the path between Graubunden and
        Linthal
%}

%% Cleaning the environment 
clear all;
close all;
clc;

%% Problem initialisation

% Defining the points where a stick lies
nodes = [0.25, 1.7057;
         0.75, 2.7449;
         1.3,  2.5580;
         1.7,  3.0326;
         1.9,  7.8285];

% Definition of the testing vector (where the path will be rebuilt)
x0 = 0.25; xn = 1.9;
xtest = linspace(x0, xn, 100);


%% Interpolating the quadratic spline

% Retrieving the coefficients of the quadratic spline
coeff = QuadraticSpline_Hand(nodes);

% Retrieving the interpolating path
ytestmat = Interpolating_Hand(nodes, xtest);


%% Plotting the reconstructed path and the sticks

% Plotting in a same figure the sticks and the interpolated spline
fig = figure();
hold on 
plot(ytestmat(:,1), ytestmat(:,2), "--r")
plot(nodes(:,1), nodes(:,2), "or")
hold off
legend("Reconstructed path", "Nodes")
title("Path plot")
xlabel("x")
ylabel("y")
savefig("figure1.fig");
close;


%% Using the interpolating spline

% Rescue team wished point
x = 1.45;

% Retrieving the interpolating path
ytestmat2 = Interpolating_Hand(nodes, [x]);

% Plotting in a same figure the sticks and the interpolated spline
fig = figure();
hold on 
plot(ytestmat(:,1), ytestmat(:,2), "--r")
plot(nodes(:,1), nodes(:,2), "or")
plot(ytestmat2(1), ytestmat2(2), "bp")
hold off
legend("Reconstructed path", "Nodes", "Stick to add")
title("Path plot")
xlabel("x")
ylabel("y")
savefig("figure2.fig");
close;



%% Plotting the reconstructed path and the sticks with linear solver

% Retrieving the interpolating path
ytestmat = Interpolating_Solver(nodes, xtest);

% Plotting in a same figure the sticks and the interpolated spline
fig = figure();
hold on 
plot(ytestmat(:,1), ytestmat(:,2), "--r")
plot(nodes(:,1), nodes(:,2), "or")
hold off
legend("Reconstructed path", "Nodes")
title("Path plot")
xlabel("x")
ylabel("y")
savefig("figure3.fig");
close;



%% Adding points at location of our choice

% Defining the points where a stick lies (should be in x increasing order)
nodes = [0.25, 1.7057;
         0.75, 2.7449;
         1.3,  2.5580;
         1.4,  -0.2;
         1.7,  3.0326;
         1.9,  7.8285];

% Definition of the testing vector (where the path will be rebuilt)
x0 = 0.25; xn = 1.9;
xtest = linspace(x0, xn, 100);

% Retrieving the interpolating path
ytestmat = Interpolating_Solver(nodes, xtest);

% Plotting in a same figure the sticks and the interpolated spline
fig = figure();
hold on 
plot(ytestmat(:,1), ytestmat(:,2), "--r")
plot(nodes(:,1), nodes(:,2), "or")
hold off
legend("Reconstructed path", "Nodes")
title("Path plot")
xlabel("x")
ylabel("y")
savefig("figure4.fig");
close;


%% Loading points from a data set and interpolating on large data

% Defining the points where a stick lies (should be in x increasing order)
struct = load("Data");
nodes = [struct.p;struct.u]';

% Definition of the testing vector (where the path will be rebuilt)
x0 = 0.25; xn = 1.9;
xtest = linspace(x0, xn, 100);

% Retrieving the interpolating path
ytestmat = Interpolating_Solver(nodes, xtest);

% Plotting in a same figure the sticks and the interpolated spline
fig = figure();
hold on 
plot(ytestmat(:,1), ytestmat(:,2), "--r")
plot(nodes(:,1), nodes(:,2), "or")
hold off
legend("Reconstructed path", "Nodes")
title("Path plot")
xlabel("x")
ylabel("y")
savefig("figure5.fig");
close;


%{
%% Plotting the reconstructed path and the signalisation

% Plotting in a same figure the two interpolated splines 
fig = figure();
hold on 
plot(xtest, ytest, "--r")
plot(xtest, ytestmat, "--b")
plot(xtest, f(xtest), "k-")
plot(xx, f(xx), "pr")
hold off
legend("Manual interp", "Matlab interp", "Function", "Nodes")
title("Function plot")
xlabel("x")
ylabel("y")

%% Getting the derivative of the reconstructed spline

% Defining the derivative function
g = @(x) cos(x)-x.*sin(x)-2.*(x-2);

% Getting the derivative coefficients from the matrix coeff
dcoeff = [3.*coeff(:,1)'; 2.*coeff(:,2)'; coeff(:,3)']';

% Evaluate the derivative values depending on in which interval they lie
ytest = [];
for inter = 1:(length(xx)-1)
        
        % Retrieving the points living in the interval inter-1
        index = find((xx(inter+1)>=xtest) .* (xx(inter)<=xtest));
        
        % Tabulating the values
        xtemp = xtest(index)-xx(inter);
        
        % Constructing the determination matrix and retrieving the
        % interpolated values
        A = [xtemp.^2; xtemp ; ones(1, length(index))];
        size(A)
        size(dcoeff)
        values = dcoeff(inter,:)*A;
        
        % Reconstructing the values within this interval
        ytest = [ytest, values];
    
end

% Plotting in a same figure the two interpolated splines 
fig = figure();
hold on 
plot(xtest, ytest, "--r")
plot(xtest, g(xtest), "k-")
hold off
legend("Manual derivatives", "Derivative Function")
title("Derivative plot")
xlabel("x")
ylabel("y")

%}