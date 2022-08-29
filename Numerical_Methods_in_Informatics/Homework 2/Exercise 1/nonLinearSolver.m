% clear
clear all;
close all;
clc;

% Parameters
f3 = @(x) tanh(x);
df3 = @(x) 1-tanh(x).^2;
epsilon = 5*10^-9;
alpha = epsilon;
a = -1;
b = 2;
itMax = 1000;

% Bisection Method
x0 = (a+b)/2;

if 0 < x0 && x0 < alpha
    x = x0;
else
    for k=1:3
        if f3(a)*f3(x0) < 0
            b = x0;
        else
            a = x0;
        end
        x0 = (a+b)/2;
        if 0 < x0 && x0 < alpha
            break;
        end
    end
    x = x0;
end

[x3, r3, it3, xxs3] = NewtonMeth(f3, df3, x, itMax, epsilon);

% Print solution
fprintf("The zero of f3 is %f with %d iterations and with the residual %f", x3, it3, r3);