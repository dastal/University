fun = @(x) 2 * cos(3*x) - exp(x);

x0 = 0.1;
x1 = 0.11;
eps = 10^(-8);
[firstX, firstIt] = secantmethod(fun,x0,x1,eps);

x0 = -1.0;
x1 = -0.9;
eps = 10^(-5);
[secondX, secondIt] = secantmethod(fun,x0,x1,eps);

xValues = (-5:0.1:5);
yValues = (101);

for i = 1:101
    yValues(i) = fun(xValues(i));
end

plot(xValues,yValues);
xlim([-5.5 5.5]);
hold on;
plot(firstX, 0, 'r.');
plot(secondX, 0, 'g.');
hold off;
legend({'Function', 'x0 = 0.1, x1 = 0.11', 'x0 = -1.0, x1 = -0.9'}, 'Location', 'Southwest');
title('Points found with the Secant Method');
xlabel('X-Values');
ylabel('Y-Values');