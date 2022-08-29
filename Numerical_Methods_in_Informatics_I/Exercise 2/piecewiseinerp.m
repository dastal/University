fun = @(x) exp(-x^(2));
nodes = (9);
ynodes = (9);
delta = 10;
functionValues = (1001);
xValues = (1001);
linearIntValues = (1001);
splineValues = (1001);

%compute the values for x
for i = 0:1000
    xValues(i+1) = -5 + ((2 * 5 / 1000) * (i));
end

%calculate the nodes
nodes(1) = xValues(1);
for i = 1:8
    nodes(i+1) = xValues(i*125 + 1);
end

%compute the y-values for the nodes
for i = 1:length(nodes)
    ynodes(i) = fun(nodes(i));
end

%compute the values for f(x)
for i = 1:1001
    functionValues(i) = fun(xValues(i));
end

%compute the linear interpolation
for i = 1:8
    if i==1
        intervalStart = 1;
    else
        intervalStart = (i-1) * 125 + 1;
    end
    intervalEnd = intervalStart + 125;
    for j = intervalStart:(intervalEnd)
        linearIntValues(j) = linearInterpolation(xValues(j), nodes(i), nodes(i+1));
    end
end

%compute the cubic spline interpolation with not-a-knot
splineValues = interp1(nodes, ynodes, xValues, 'spline');
   
%Plot
plot(xValues, functionValues);
hold on;
plot(xValues, linearIntValues);
plot(xValues, splineValues);
title('Piecewise Polynomial Interpolation');
xlabel('-5 <= x <= 5');
ylabel('y = exp(-x^2)');
xlim([-5.05 5.15]);
ylim([-0.05 1.05]);
legend({'Function', 'Linear Interpolation', 'Cubic Spline Interpolation'},'Location','northeast')
savefig('piecewise.fig');
hold off;

function res = linearInterpolation(x, xi, xi1)
    fun = @(x) exp(-x^2);
    res = fun(xi) + ((fun(xi1) - fun(xi))/(xi1 - xi)) * (x - xi);
end