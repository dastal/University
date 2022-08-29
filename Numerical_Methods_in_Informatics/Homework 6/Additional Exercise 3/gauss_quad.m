%% Clearing the Environment
clear all;
close all;
clc;

%% Initialisation 3a)
% Number of points for the Gauss quadrature
N = 5;

% Function to integrate
f = @(X) exp(X);

% Integration domain
a = -3;
b = 3;

Itheo = f(b)-f(a);

%% Manual "classical" computation of L5
L_5 = @(X) 1/8*(63*X.^5-70*X.^3+15*X);

L_5der = @(X) 1/8*(63*5*X.^4-70*3*X.^2+15);

%% Plotting of the L5 3b)
% x Values
lx = linspace (-1,1,100);

% Plot
plot(lx,L_5(lx));
hold on;
yline(0);
grid;
title("Legendre Polynomial L5");
xlabel("X");
ylabel("Y");
legend("L_5(x)");
savefig("l5.fig");
hold off;
close;

% So we obtain initial guesses for root finding

%% Find the roots using the Newton mehtod
% Initial guesses
lx0 = [-1,-0.6,0.1,0.6,1];

% Empty array for y values
yi_bar = [];

% Tolerance
tol = 1e-6;

% Maximum iterations
itmax = 100;

% Print message what happens next
fprintf("\nFinding the zeros using several Newton Methods:\n\n");

% Finding the nodes by solving L5(yi)=0 for multiple values
for x0=lx0
    yi_bar = [yi_bar newton_solve(L_5,L_5der,x0,tol,itmax)];
end

% Conversion to variable precision arithmetic instead of fractions

%% Quadrature weights 3c)

% Gauss-Legendre Formula
% Weights
alpha_bar = 2./((1-yi_bar.^2).*L_5der(yi_bar).^2);

% Resizing the weights
alpha = (b-a)/2.*alpha_bar;

% Resizig the value
yi = (a+b)/2+(b-a)/2.*yi_bar;

%% Theoretical result slide 18 of 9_DiffInt.pdf
amid = 128/225;
aa = 1/900*(322+13*sqrt(70));
ab = 1/900*(322-13*sqrt(70));
alpha_bar_theo = [ab aa amid aa ab];

ya = 1/21*sqrt(245-14*sqrt(70));
yb = 1/21*sqrt(245+14*sqrt(70));
yi_bar_theo = [-yb -ya 0 ya yb];

% Computing the errors
error_alpha_bar = max(abs(alpha_bar-alpha_bar_theo));
error_yi_bar = max(abs(yi_bar-yi_bar_theo));

fprintf("\n---------------------------------------\n");
fprintf("\nError on the weights: %.1e\n", error_alpha_bar);
fprintf("\nError on the nodes: %.1e\n", error_yi_bar);

%% Gauss quadrature

Igauss = sum(alpha.*f(yi));
fprintf("\n---------------------------------------\n");
fprintf("\nExact value of the integral: %.5f\n", Itheo);
fprintf("\nGauss quadrature of the integral: %.5f\n", Igauss);

fprintf("\nAbsolute error on the integral: %.5f\n", abs(Itheo-Igauss));
fprintf("\nRelative error on the integral: %.5f %%\n", abs((Itheo-Igauss)/Itheo)*100);
