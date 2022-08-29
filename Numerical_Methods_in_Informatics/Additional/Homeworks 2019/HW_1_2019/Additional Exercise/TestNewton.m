% clear
clear all;
close all;
clc;

% 1b) Different Test Cases
% Parameters
convergence = 5.0*10^(-5);
itMax = 1000;

% Test 1
f1 = @(x) x.^2-9;
ff1 = @(x) 2.*x;
x01 = 0.1;
[x1, it1, xx1] = newtonsMethod(f1, ff1, x01, convergence, itMax);

% Test 2
f2 = @(x) (x-4).^2;
ff2 = @(x) 2.*(x-4);
x02 = 0.1;
[x2, it2, xx2] = newtonsMethod(f2, ff2, x02, convergence, itMax);

% Test 3
f3 = @(x) tanh(x);
ff3 = @(x) 1-tanh(x).^2;
x03 = 2;
[x3, it3, xx3] = newtonsMethod(f3, ff3, x03, convergence, itMax);

% 1c) Convergence Rate of f1
r2k = zeros(it1-2,1);
xValues1 = zeros(it1-2,1);

for k=3:it1
    r2k(k-2) = abs(xx1(k)-xx1(k-1))/abs(xx1(k-1)-xx1(k-2))^2;
    xValues1(k-2) = k;
end

% ploting Convergence Rate of f1
plot(xValues1,r2k);
hold on;
title("Convergence Rate of f1");
xlabel("x");
ylabel("Convergence Rate");
savefig("convergenceRateF1");
hold on;
close;

% 1d) Convergence Rate of f2
r1k = zeros(it2-2,1);
xValues2 = zeros(it2-2,1);

for k=3:it2
    r1k(k-2) = abs(xx2(k)-xx2(k-1))/abs(xx2(k-1)-xx2(k-2));
    xValues2(k-2) = k;
end

% ploting Convergence Rate of f2
plot(xValues2,r1k);
hold on;
title("Convergence Rate of f2");
xlabel("x");
ylabel("Convergence Rate");
xlim([min(xValues2) max(xValues2)]);
ylim([0 1]);
savefig("convergenceRateF2");
hold on;
close;

% 1e) The Newt0n's Method does not fit for this initial guess. Maybe
% another guess would fit better...