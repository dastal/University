% clear
clear all;
close all;
clc;

% Parameters
f = @(x) exp(-2.*x.^2);
d = 1;
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
for i = -d:0.002:d
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
xlabel('-1 <= x <= 1');
ylabel('y = exp(-x^2)');
xlim([-d-0.05 d+0.05]);
legend({'Function', 'k = 2', 'k = 4', 'k = 6', 'k = 8', 'k = 10'},'Location','south')
savefig('additional_interp_n.fig');
hold off;
close;

% computing the error
% Parameters
c = 1;
error2 = zeros(1, 1001);
error4 = zeros(1, 1001);
error6 = zeros(1, 1001);
error8 = zeros(1, 1001);
error10 = zeros(1, 1001);

% initialize errorX (for the degrees) and y values
errorX = degrees;
errorY = zeros(1, 5);

% Compute errors
for j = 1:1001
   error2(j) = abs(yValues(j) - polynomials(1,j));
   error4(j) = abs(yValues(j) - polynomials(2,j));
   error6(j) = abs(yValues(j) - polynomials(3,j));
   error8(j) = abs(yValues(j) - polynomials(4,j));
   error10(j) = abs(yValues(j) - polynomials(5,j));
end

% Fill max erros
errorY(1) = max(error2);
errorY(2) = max(error4);
errorY(3) = max(error6);
errorY(4) = max(error8);
errorY(5) = max(error10);

% Convergence
cy1 = zeros(1, 5);
cy2 = zeros(1, 5);
cy3 = zeros(1, 5);

for i = 1:5
    cy1(i) = exp(-c*i^1);
    cy2(i) = exp(-(2*c*i^2));
    cy3(i) = exp(-(3*c*i^3));
end

% Plot Errors
loglog(errorX, errorY);
hold on;
loglog(errorX, cy1);
loglog(errorX, cy2);
loglog(errorX, cy3);
title("Errors");
xlabel("Nodes");
ylabel("Errors");
legend(["Error", "Degree 1", "Degree 2", "Degree 3"], "Location", "Southwest");
savefig('err_interp_n.fig');
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