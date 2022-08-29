% clear
clear all;
close all;
clc;

% Parameters
f = @(x) 1./(1+25.*x.^2);
d = 1;
degrees = [4,9,19];

% computing the x Values for the equidistant computation (n=1000)
xValues = -d:2*d/1000:d;

% computing the function values of the equidistant computation
yValues = f(xValues);

% Looping on each wished degree
for k=1:3
    
    % Retrieving the considered degree
    deg = degrees(k);
    
    % Initialising the solution vectors
    Pi_neq = zeros(length(xValues), deg+1);
    Pi_nch = zeros(length(xValues), deg+1);
    
    % Define the equidistant nodes
    eqnodes = (-d: 2*d/(deg): d);
    yyeq = f(eqnodes);
    [phi] = LagranCharPoly(eqnodes, xValues);
    Pi_neq(:,k) = phi*yyeq';
    
    % Define the chebyshev nodes
    chebynodes = cos((2.*(1:(deg+1))-1)./(2.*(deg+1)).*pi);
    yycheb = f(chebynodes);
    [phi] = LagranCharPoly(eqnodes, xValues);
    Pi_nch(:,k) = phi*yycheb';
    
    % define the plot title and name
    plottitle = ("Interpolation with n = " + num2str(deg));
    plotname = ("degree" + num2str(deg) +".fig"); 
    
    plot(xValues, yValues, 'b', 'linewidth', 2);
    hold on;
    plot(xValues, Pi_neq(:,k), 'k', 'linewidth', 2);
    plot(xValues, Pi_nch(:,k), '--r', 'linewidth', 2);
    title(plottitle);
    legend(["Exact Funtion", "Equidistant Points", "Chebyshev Nodes"]);
    xlabel("x");
    ylabel("f(x)");
    savefig(plotname);
    hold off;
    close;    
end

