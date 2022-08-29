%% clear all
clear all;
close all;
clc;

%% Define the problem
% Function
f = @(x) x.^2.*exp(-x);

% Exact function
g = @(x) -exp(-x).*(x^2+2*x+2);

% Derivatives
firstDer = @(x) (-x.^2+2.*x).*exp(-x);
secondDer = @(x) (x.^2-4.*x+2).*exp(-x);
thirdDer = @(x) (-x.^2+6.*x-6).*exp(-x);
fourthDer = @(x) (x.^2-8.*x+12).*exp(-x);

% Defining the interval bounds for the integration
a = 0;
b = 3;

% Compute the exact value of the integal in the given interval
Iex = g(b)-g(a);

% Define the number of subintervals
ns = pow2([1:7]);

%% Computing the Interval Approximations
% Error vectors
errorSimp = zeros(1,7);
errorTrap = zeros(1,7);

% Compute the Integrals
for i=1:length(ns)
    % Simpson
    errorSimp(i) = abs(Iex-comp_simpson(f,a,b,ns(i)));
    % Trapezoidal
    errorTrap(i) = abs(Iex-comp_trap(f,a,b,ns(i)));
end

%% Plot
% x Values for plot
xValues = (1:7);

% Plotting
loglog(ns,errorSimp,'k','linewidth',1.5);
hold on;
loglog(ns,1./(ns.*ns),'r--','linewidth',1.5);
loglog(ns,errorTrap,'b','linewidth',1.5);
loglog(ns,1./(ns.*ns.*ns.*ns),'g--','linewidth',1.5);
title('Errors of Newton Coates Formulas with Theoretical Convergence');
xlabel('log(z)');
ylabel('log(Error)');
legend({'Error Simpson Quadrature', 'Second Order', 'Error Trapezoidal Quadrature', 'Fourth Order'}, 'location', 'best');
savefig("plot_quadr.fig");
hold off;
close;

%% Compute Minimum Numbers of Subintervals
% Defining the absolute error border
error = 1e-5;

% Defining the array with x Values
x_dis = linspace(a,b,20);

% Simpson
maxdf4 = max(abs(fourthDer(x_dis)));
h4s = error*16*180/(maxdf4*(b-a));
hsS = sqrt(sqrt(h4s));
nsimS = ceil((b-a)./hsS);

% Tapezoidal
maxdf2 = max(abs(secondDer(x_dis)));
h2s = error*12/(maxdf2*(b-a));
hsT = sqrt(sqrt(h2s));
nsimT = ceil((b-a)./hsT);

% printing
fprintf("To have err<=%5.4e with the Simpson quadrature formula, we need h=%4.2f that is %d intervals.\n", error, hsS, nsimS);
fprintf("To have err<=%5.4e with the Tapezoidal quadrature formula, we need h=%4.2f that is %d intervals.\n", error, hsT, nsimT);
