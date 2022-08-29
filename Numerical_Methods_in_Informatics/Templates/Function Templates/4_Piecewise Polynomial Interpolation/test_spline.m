% clear
clear all;
close all;
clc;

% parameters
f = @(x) x.*cos(x)-(x-2).^2-1;
x0 = 0;
xn = 5;

% computing the nodes and yys
n = 5;
nodes = zeros(n+1,1);

for i=1:n+1
    nodes(i) = i-1;
end

yys = f(nodes);

%% computing the natural cubic spline
points = 100;
coeffs = Cubic_Spline_Natural_Spline(nodes, yys);
xValues = transpose(linspace(0,n,points+1));
vx = zeros(points+1,1);

for i=1:points+1    
    j = ceil(i/(points/n));
    if j > n
        j = n;
    end
    x_xi = xValues(i)-nodes(j);
    vx(i) = coeffs(j,4) + coeffs(j,3)*(x_xi) + coeffs(j,2)*(x_xi)^2 + coeffs(j,1)*(x_xi)^3;
end

% VX = values of natural Spline

%% Computing the not-aknot-spline
[not_a_knot] = Cubic_Spline_Not_a_Knot(nodes,yys,xValues);

%% Computing the Complete Spline
fder = @(x) x.*cos(x)-(x-2).^2-1;
[coeff1] = Cubic_Spline_Complete_Spline(nodes, yys, fder);
