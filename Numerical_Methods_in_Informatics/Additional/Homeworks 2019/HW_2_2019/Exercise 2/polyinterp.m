% clear
clear all;
close all;
clc;

% Parameters
f = @(x) exp(-2.*x.^2);
d = 5;
numberOfPoints = 1001;
degrees = [2 4 6 8 10];
nodes2 = (degrees(1)+1);
nodes4 = (degrees(2)+1);
nodes6 = (degrees(3)+1);
nodes8 = (degrees(4)+1);
nodes10 = (degrees(5)+1);
polynomials = zeros(5,numberOfPoints);
xValues = (numberOfPoints);

% computing the nodes
% n = 2
for i=1:degrees(1)+1
    nodes2(i) = -d + (2*d)/degrees(1) * (i-1);
end

% n = 4
for i=1:degrees(2)+1
    nodes4(i) = -d + (2*d)/degrees(2) * (i-1);
end

% n = 6
for i=1:degrees(3)+1
    nodes6(i) = -d + (2*d)/degrees(3) * (i-1);
end

% n = 8
for i=1:degrees(4)+1
    nodes8(i) = -d + (2*d)/degrees(4) * (i-1);
end

% n = 10
for i=1:degrees(5)+1
    nodes10(i) = -d + (2*d)/degrees(5) * (i-1);
end

% computing the x Values
for i = 1:1001
    xValues(i) = -d + ((2 * d / 1000) * (i-1));
end

% computing the y Values
yValues = f(xValues);

% computing the polynomials
% polynomials:  lines: L2(x); L4(x); L6(x); L8(x); L10(x)
%               columns: values for each interpolation
% currentIntervalIndex: current index of x Value in interval
% find "polynomial calculator" at the end of the script
currentIntervalIndex = 1;
for i = -d:0.01:d
    polynomials(1, currentIntervalIndex) = polynomialCalculator(2, nodes2, i);
    polynomials(2, currentIntervalIndex) = polynomialCalculator(4, nodes4, i);
    polynomials(3, currentIntervalIndex) = polynomialCalculator(6, nodes6, i);
    polynomials(4, currentIntervalIndex) = polynomialCalculator(8, nodes8, i);
    polynomials(5, currentIntervalIndex) = polynomialCalculator(10, nodes10, i);
    currentIntervalIndex = currentIntervalIndex + 1;
end

%Plot
plot(xValues, yValues);
hold on;
plot(xValues, polynomials(1,:));
plot(xValues, polynomials(2,:));
plot(xValues, polynomials(3,:));
plot(xValues, polynomials(4,:));
plot(xValues, polynomials(5,:));
title('Lagrangian Ploynomials for the Function exp(-x^2)');
xlabel('-5 <= x <= 5');
ylabel('y = exp(-x^2)');
xlim([-d-0.05 d+0.05]);
ylim([-1.55 2.55]);
legend({'Function', 'k = 2', 'k = 4', 'k = 6', 'k = 8', 'k = 10'},'Location','south')
savefig('interp_n.fig');
hold off;
close;

%function to compute the different polynomials
function res = polynomialCalculator(k, xValues, x)
    k = k+1;
    res = 0;
    fun = @(x) exp(-x^(2));
    y = (k);
    for i=1:k
        y(i) = fun(xValues(i));
    end
    for i=1:k
        prod = 1;
        for j=1:k
            if i~=j
                term = (x-xValues(j))/(xValues(i)-xValues(j));
                prod = prod * term;
            end
        end
        res = res + prod * y(i);
    end
end