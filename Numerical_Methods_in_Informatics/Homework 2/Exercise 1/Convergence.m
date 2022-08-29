% clear
clear all;
close all;
clc;

% Parameters
x0 = 0.1;
epsilon = 5*10^-9;
itMax = 1000;
f1 = @(x) x.^2-9;
df1 = @(x) 2.*x;
[x, r, it, xxs] = NewtonMeth(f1, df1, x0, itMax, epsilon);
r2k = zeros(it-2,0);
xValues = zeros(it-2,0);

% Computing the Convergence
for k=3:it
    r2k(k-2) = abs(xxs(k)-xxs(k-1))/(abs(xxs(k-1)-xxs(k-2))^2);
    xValues(k-2) = k;
end

% finding convergence value
convergenceLine1 = max(r2k).*ones(length(xValues),1);

% Displaying the convergence of f1
fprintf("The convergence of the function f1 is %.4f)", r2k(it-2));

% Parameters of f2
f2 = @(x) (x-4).^2;
df2 = @(x) 2.*(x-4);
[x2, r2, it2, xxs2] = NewtonMeth(f2, df2, x0, itMax, epsilon);
r2k2 = zeros(it2,0);
xValues2 = zeros(it2,0);

% Computing convergence of f2
for k=1:it2
    r2k2(k) = abs(xxs2(k)-x2);
    xValues2(k) = k;
end

% Plotting Plot 1
plot(xValues, r2k);
hold on;
plot(xValues, convergenceLine1, 'k--');
xlabel("x");
ylabel("Convergence of f1");
title("Convergence of f1");
legend(["r2k", "Convergence"], "Location", "Southeast");
savefig("PlotConvF1.fig");
hold off;
close;

% Plotting Plot 2
loglog(r2k2(1:it2-1), r2k2(2:it2));
hold on;
for p=1:4
   loglog(r2k2(2:end),r2k2(2:end).^p,"--"); 
end
xlabel("x");
ylabel("Convergence of f2");
title("Convergence of f2");
legend(["r2k", "Order 1", "Order2", "Order 3", "Order 4"], "Location", "Southeast");
grid;
savefig("PlotConvF2.fig");
hold off;
close;
