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

% computing the natural cubic spline
points = 100;
coeffs = naturalspline(nodes, yys);
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

%computing the exact fucntion values
yValues = f(xValues);

% computing the not-a-knot splines
not_a_knot = spline(nodes,yys,xValues);

% plotting all the values
plot(xValues,yValues);
hold on;
plot(xValues, vx);
plot(xValues,not_a_knot);
scatter(nodes,yys);
title("Piecewise Polynomial Interpolation");
xlabel("x");
ylabel("y");
legend("Exact Function", "Natural Splines", "Not-a-Knot Splines", "Initial Nodes");
savefig("PlotSplines.fig");
hold off;
close;

% compute the derivatives of vx
pp = mkpp(nodes, coeffs);
coefs = pp.coefs(:,1:end-1);
vxDer = zeros(points+1,1);

for i=1:points+1
    if (i>=1 && i<21)
        x_xi = xValues(i)-nodes(1);
        vxDer(i) = coefs(1,3) + 2*coefs(1,2)*(x_xi) + 3*coefs(1,1)*(x_xi)^2;
    elseif (i>=21 && i<41)
        x_xi = xValues(i)-nodes(2);
        vxDer(i) = coefs(2,3) + 2*coefs(2,2)*(x_xi) + 3*coefs(2,1)*(x_xi)^2;
    elseif (i>=41 && i<61)
        x_xi = xValues(i)-nodes(3);
        vxDer(i) = coefs(3,3) + 2*coefs(3,2)*(x_xi) + 3*coefs(3,1)*(x_xi)^2;
    elseif (i>=61 && i<81)
        x_xi = xValues(i)-nodes(4);
        vxDer(i) = coefs(4,3) + 2*coefs(4,2)*(x_xi) + 3*coefs(4,1)*(x_xi)^2;
    elseif (i>=81 && i<=101)
        x_xi = xValues(i)-nodes(5);
        vxDer(i) = coefs(5,3) + 2*coefs(5,2)*(x_xi) + 3*coefs(5,1)*(x_xi)^2;
    end
end

% compute the actual derivative of f
fDer = @(x) -x.*sin(x)+cos(x)-2.*(x-2);
yValuesDer = fDer(xValues);

plot(xValues, yValuesDer);
hold on;
plot(xValues, vxDer);
title("Derivatives of Piecewise Polynomial Interpolation");
xlabel("x");
ylabel("y");
legend("Derivative of Exact Function", "Derivatives of Natural Splines");
savefig("PlotDerivSplines.fig");
hold off;
close;