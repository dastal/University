eps = 0.0015;
n = tolerance_series(eps);

xValues = (n);
yValues = (n);

for i = 1:n
    xValues(i) = i;
end

sum = 0;
for i = 1:n
    sum = sum + 1/(((2 * i) - 1)^2);
    yValues(i) = sum;
end

scatter(xValues, yValues);
yline(yValues(n), '--', 'Limit Value', 'LineWidth', 3);
