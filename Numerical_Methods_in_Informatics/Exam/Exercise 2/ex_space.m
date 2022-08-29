%% Clearing Environment
clear all;
close all;
clc;

%% Exercise 2a) Taylor Series
% Maximum absolute Error
tol = 0.015;

% Interval
Ia = 0;
Ib = pi;

% 100 equally spaced points
N = 100;
interval = linspace(Ia,Ib,N)';

% Function
f = @(x) x-1-0.5*sin(x);

% Function derivatives
fder = @(x) 1-0.5*cos(x);
fder2 = @(x) 0.5*sin(x);
fder3 = @(x) 0.5*cos(x);
fder4 = @(x) -0.5*sin(x);
fder5 = @(x) -0.5*cos(x);
fder6 = @(x) 0.5*sin(x);

% Base point
a = pi/2;

% Base Point set into function and derivations
y_a = [f(a) fder(a) fder2(a) fder3(a) fder4(a) fder5(a) fder6(a)];

% Computing the y values of the function
y = f(interval);

% Highest Order (+1 to avoid 0 index in array)
highest_order = 6+1;

% Error Storage
f_hat = zeros(N,highest_order);

% Taylor Series Expansion
for p = 1:(highest_order)
    for n = 1:p
        f_hat(:,p) = f_hat(:,p)+y_a(n)*(interval-a).^(n-1)/factorial(n-1);
    end
end

% Computing errors
errors = abs(f_hat-y);
err_p= max(errors);
[~,pMin]=max(err_p<tol);

% Answer the question
fprintf("The minimum order of TS giving a max_E<%.3f is: %d \n", tol, pMin-1)

% Plotting
figure();
semilogy(interval,errors);
hold on
plot([interval(1) interval(end)],tol*[1 1],'k--');
% Write legend labels
labels=strings(highest_order+1,1);
for p=1:highest_order
    labels(p)=sprintf('Err_%d',p-1);
end
labels(end)='ErrTol';
% Write axis labels and titles
xlabel('x'); 
ylabel('Error, |f(x)-TS_p(x)|');
title('Error for the Taylor series approximation of f(x)')
legend(labels,'Location','southeast','NumColumns',2)
savefig("x_vs_errors.fig");
hold off;
close;

%% Exercise 2b) Forward finite Difference
% Function
f = @(x) x-1-0.5*sin(x);

% x_bar
x_bar = pi/4;

% Height
hs=1.d1.^[0:-1:-15];

% Computing forward finite difference
d_f_x = (f(x_bar+hs)-f(x_bar))./hs;

% Computing Error
error = abs(fder(x_bar)-d_f_x);

% Answer the question
[~,iMin] = min(error);
fprintf("Round-off starts to dominate for h<%.1e \n", hs(iMin));

% Estimate for M in the interval
M=max(abs(fder(interval)))/2;

% Plotting
figure();
loglog(hs,error);
hold on;
loglog(hs, M*hs,'r--')
legend('Total Error', 'Estimate trunc error','Location', 'SouthEast')
xlabel('h'); 
ylabel("Error, |f'(x)-\delta_+f(x)|");
title(sprintf('Error for forward finite difference at x=%.3f',x_bar));
savefig("h_vs_error.fig");
hold off;
close;

%% Exercise 2c) Secant Method
% Function
f = @(x) x-1-0.5*sin(x);

% Guesses
x0 = pi;
x1 = 3;
guesses = [x0 x1];

% Tolerance
tol = 1e-12;

% Use secant solver
[x, it] = secant_solver(f, guesses, tol);

% Plotting
figure();
plot(interval,y);
hold on;
plot(x,f(x),'ro');
labels = ['f(x)';'root'];
xlabel("x");
ylabel("f(x)");
title(sprintf('Root of f(x) computed in %d iterations',it));
legend(labels,'Location','northwest');
savefig("root_secant.fig");
hold off;
close;
