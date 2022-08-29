% Exercise 
eps = 5.0 * 10^(-5);
maxIt = 150;

f1 = @(x) x^2 - 9;
x0 = 0.1;
derivativeF1 = @(x) 2*x;
[xdev1, it1, xx1] = newtonsMethod(f1, derivativeF1, x0, eps, maxIt);

f2 = @(x) (x-4)^2;
x0 = 0.1;
derivativeF2 = @(x) 2*(x-4);
[xdev2, it2, xx2] = newtonsMethod(f2, derivativeF2, x0, eps, maxIt);

f3 = @(x) tanh(x);
x0 = 2.0;
derivativeF3 = @(x) 1-tanh(x);
newtonsMethod(f3, derivativeF3, x0, eps, maxIt);

% Exercise 3c
yValuesR2 = (length(xx1)-2);

for i = 3:length(xx1)
    yValuesR2(i) = abs(xx1(i)-xx1(i-1))/abs(xx1(i-1)-xx1(i-2))^2;
end

xValuesR2 = (1:length(yValuesR2));

% Exercise 3d
yValuesR1 = (length(xx2)-2);

 for i = 3:length(xx2)
     yValuesR1(i) = abs(xx2(i)-xx2(i-1))/abs(xx2(i-1)-xx2(i-2));
 end
 
 xValuesR1 = (1:length(yValuesR1));

% Plots
plot(xValuesR2,yValuesR2);
hold on;
plot(xValuesR1, yValuesR1);
legend({'r1', 'r2'});
hold off;