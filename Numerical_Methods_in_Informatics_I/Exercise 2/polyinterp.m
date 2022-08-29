fun = @(x) exp(-x^(2));
nodes2 = (3);
nodes4 = (5);
nodes6 = (7);
nodes8 = (9);
nodes10 = (11);
polynomials = zeros(5,1001);
functionValues = (1001);
xValues = (1001);

%compute the nodes
for i = 1:3
    nodes2(i) = -5 + (2*5)/2 * (i-1);
end

for i = 1:5
    nodes4(i) = -5 + (2*5)/4 * (i-1);
end

for i = 1:7
    nodes6(i) = -5 + (2*5)/6 * (i-1);
end

for i = 1:9
    nodes8(i) = -5 + (2*5)/8 * (i-1);
end

for i = 1:11
    nodes10(i) = -5 + (2*5)/10 * (i-1); 
end

%compute the values for x
for i = 1:1001
    xValues(i) = -5 + ((2 * 5 / 1000) * (i-1));
end

%compute the values for f(x)
for i = 1:1001
    functionValues(i) = fun(xValues(i));
end

%compute the polynomials
indexInterval = 1;
for d = -5:0.01:5
    polynomials(1, indexInterval) = polynomialCalculator(2, nodes2, d);
    polynomials(2, indexInterval) = polynomialCalculator(4, nodes4, d);
    polynomials(3, indexInterval) = polynomialCalculator(6, nodes6, d);
    polynomials(4, indexInterval) = polynomialCalculator(8, nodes8, d);
    polynomials(5, indexInterval) = polynomialCalculator(10, nodes10, d);
    indexInterval = indexInterval + 1;
end

%Plot
plot(xValues, functionValues);
hold on;
plot(xValues, polynomials(1,:));
plot(xValues, polynomials(2,:));
plot(xValues, polynomials(3,:));
plot(xValues, polynomials(4,:));
plot(xValues, polynomials(5,:));
title('Lagrangian Ploynomials for the Function exp(-x^2)');
xlabel('-5 <= x <= 5');
ylabel('y = exp(-x^2)');
xlim([-5.05 5.05]);
ylim([-1.55 2.55]);
legend({'Function', 'k = 2', 'k = 4', 'k = 6', 'k = 8', 'k = 10'},'Location','north')
savefig('interp_n.fig');
hold off;

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