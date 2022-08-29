%% Clearing the Environment
clear all; 
close all; 
clc;

%% Exercise 3b) Computing the gammas
% Nodes
x1= -(1+sqrt(6))/5;
x2= (1+sqrt(6))/5;

% Solving the integral of phi(x):
gammas=zeros(3,1);
gammas(1)=(2/3+2*x2)/(x1-x2)/(x1-1);
gammas(2)=(2/3+2*x1)/(x2-x1)/(x2-1);
gammas(3)=(2/3+2*x1*x2)/(1-x1)/(1-x2);

%% Exercise 3c1) Computing Quadrature
% Function
fun=@(x) 1 - exp(x-1);

% Use Qadrature
Q=gammaQuadr(fun(x1), fun(x2), fun(1), gammas); % Or: Q=1.16;

% Find Interpolants
[p3int] = FindInterp(x1, x2, fun(x1), fun(x2), fun(1), Q);

% Printing Answer
fprintf('N3f(x)=%.2f x^3 + %.2f x^2 + %.2f x + %.2f\n', p3int);

%% Exercise 3c2) Plotting
% x Values
x_dis = linspace(-1,1);

% Plot
figure();
plot(x_dis, fun(x_dis));
hold on
plot(x_dis, polyval(p3int,x_dis),'Linewidth',2);
plot([x1 x2 1], [fun(x1), fun(x2), fun(1)],'o','Linewidth',2);
legend('f(x)','\Pi_3f(x)', 'Nodes')
xlabel('x')
ylabel('f(x)')
title('Interpolating polynomial \Pi_3f(x), s.t. \int \Pi_3f(x) dx = Q')
savefig("quadrature.fig");
hold off;
close;
