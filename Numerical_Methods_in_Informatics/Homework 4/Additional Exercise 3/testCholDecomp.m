%% Clearing Environment
clear all;
close all;
clc;

%% Initialization (3b)
% Parameters
n = 5;

% Smart construction of A
A = eye(n).*[1 13 77 194 365]+diag([2 23 83 179],1)+diag([4 21 60],2);
% Symmetrization
A = A+(triu(A,1)');

%% Test of the Colesky Decomposition Method
[R,Rt] = cholDecomp(A);
disp("R:");
disp(R);
disp("Rt");
disp(Rt);

disp("Test of equality with A");
disp(max(max(abs(Rt*R-A)))<=1e-8)

%% Application to least square regression
% pairs of data
n = 6;
xx = 0:5;
yy = [0.1 1.4 2.1 2.8 3.9 5.1];

m = 1;  % linear regression
B = xx'.^(0:m);
A = B'*B;
b = B'*yy';

% Cholesky decomposition on square symmetric Bt*B
[lsR, lsRt] = cholDecomp(A);

% Solving
a_temp = lsRt\b;
a=lsR\a_temp;

disp("Coefficients using Cholesky:");
disp(a);

% Plotting
x_plot = linspace(xx(1),xx(end),100);
plot(xx,yy,'bo');
hold on;
plot(x_plot,a(1)+a(2)*x_plot,'b:');
xlabel('x');
ylabel('y');
title('Linear regression using Cholesky Decomposition');
grid;
legend('Data','Linear Regression');
savefig('linRegChol.fig');
hold off;
close;

%% QR factortization for linear regression
[Q,R] = qr(B);

x = R\Q'*yy';
disp("Coefficients using QR");
disp(x);

disp("Difference between the coefficients");
disp(x-a);
