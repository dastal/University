%% clear
clear all;
close all;
clc;

%% Parameters
f = @(x) exp(-x.^2);        %function
d = 2;                      %interval

%% Generate the points on which to test the interpolation function
% Abscissa
xValues = -d:2*d/1000:d;

% Reteieve the exact number of points that were generated
Nj = size(xValues,2);

% Creating the exact values at those points
yValues = f(xValues);

%% Generating the interpolation polynomials for several degrees
% Generate the number of nodes to consider for getting the degrees
% 2,4,...,10
nns = 3:2:11;

% Retrieve the number of interpolant functions to create
Nk = length(nns);

% Initialise the interpolated polynomial values
Pi_n = zeros(Nj, Nk);

% Initialise the error vector
errors = zeros(1, Nk);

% Loop over the wished degrees
for k = 1:Nk
    
    % Retrieve the number of nodes
    n = nns(k);
    
    % Generate the nodes from which we want to interpolate
    nodes = [-d: 2*d/n :d];
    
    % Emulate a data set to interpolate at by evaluating the exact function
    % at the above node
    yys = f(nodes);
    
    % Evaluate the characteristic polynomials
    [phi] = LagranCharPoly(nodes, xValues);
    
    % Reconstruction of the interpolation
    Pi_n(:, k) = phi*yys';
    
    % Compute the errors over all the evaluated points
    errors(k) = max(abs(Pi_n(:,k)-yValues'));
    tmp_s = sprintf("Pi_%df", n-1);
end

%% Plot the results
% Plot the interpolated function over the test vector
plot(xValues, yValues, 'k','linewidth',2);
hold on;
plot(xValues, Pi_n);
legend(["f", "\Pi_2", "\Pi_4", "\Pi_6", "\Pi_8", "\Pi_1_0"],"location","South");
xlabel("x");
ylabel("f(x)");
title("Lagrangian interpolation");
savefig("fun_interp_n.fig");
hold off;
close;

% Error estimation: err(n) = C exp(-n p)
semilogy(nns,errors,"k--","linewidth",1.5);
hold on;
title("Error of polynomial interpolation");
xlabel("n");
ylabel("max|\Pi_n - f|");

% Plot the reference guides
semilogy(nns, exp(-nns));
semilogy(nns, exp(-2.*nns));
semilogy(nns, exp(-3.*nns));
legend(["err", "p=1", "p=2", "p=3"], "Location", "Southwest");
savefig("err_interp_n.fig");
hold off;
close;
