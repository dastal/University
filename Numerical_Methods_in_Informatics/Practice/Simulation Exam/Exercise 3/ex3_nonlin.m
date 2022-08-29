%% Clearing the Environment
clear all;
close all;
clc;

%% Part c: Solving the linear Problem and check the convergence
% Function
f = @(x) (x-1)*log(x);

% Derivation of the function
fder = @(x) log(x)+((x-1)/x);

% Exact zero
x_ex = 1;

% Interval
a = 0.5;
b = 1.8;

% x0 as midpoint of interval I0
x0 = 0.5*(a+b);

% apply the standard Newton method
[x, it, xx] = std_newton(f, fder, x0);

% Compute the errors using xx
err = abs(xx-x_ex);

% Compute the convergence in each step
c = err(2:end)./err(1:end-1);

% Averaging the last 5 iterations
C1 = sum(c(end-4:end))/5;
fprintf("Expected order of convergence p=1 with C=%6.3f \n", C1);

% Plotting
plot(c,"DisplayName","Computed Convergence");
hold on;
yline(C1,"r","DisplayName","Expected Convergence");
title("Standard Newton");
xlabel("Iterations");
ylabel("Convergence");
ylim([0.491 0.501]);
grid;
legend("location","southeast");
savefig("std_new.fig");
hold off;
%close;

%% Part d) modified Netwon method
% Multiplicity
m = 2;

% Apply modified Newton method
[x_mod, it_mod, xx_mod] = mod_newton(f, fder, x0, m);

% Compute the error
err_mod = abs(xx_mod-x_ex);

% Plotting
semilogy(err,"DisplayName","Standard Newton");
hold on;
semilogy(err_mod,"DisplayName","Modified Newton");
grid;
legend();
title("Error Comparison of Standard vs. Modified Newton Method");
xlabel("Iterations");
ylabel("Error");
savefig("err_comp.fig");
hold off;
%close;