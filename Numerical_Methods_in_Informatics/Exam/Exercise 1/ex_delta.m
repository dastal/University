%% Clearing the Environment
clear all;
close all;
clc;

%% Defining the Problem
% Matrix A
A = [7 -3 1;
    -3 5 1;
    1 1 3];

% Vector b
b = [-1 5 -3]';

% n
n = 7;

% 7 Different values for gamma in the Interval [2.75,5.75]
deltas = linspace(4.75,7.75,n);

% Initial guess
x0 = zeros(1,length(b))';

% Maximum iterations
itMax = 100;

% storage for all results
xxs = zeros(3,7);
its = zeros(1,7);
err_hists = zeros(itMax,7);

%% Applying the SOR-method
% Iterating over deltas
for i = 1:length(deltas)
    [xxs(:,i), its(:,i), err_hist(:,i)] = gamma_iteration(A, b, x0, deltas(i));
end

%% Plotting
% Finding optimal delta
[itMin,kMin] = min(its);

% Plot
f1=figure();
hold on;
set(gca, 'YScale', 'log');
labels=strings(n,1);
for k=1:n
    labels(k)=sprintf(" %s= %.2f", "\delta", deltas(k));
    if(k==kMin)
        % Use thicker line for optimal value
        semilogy(err_hist(1:its(k),k),'Linewidth',2);
    else
        semilogy(err_hist(1:its(k),k));
    end
end
legend(labels, 'Location', 'SouthWest')
title('Iterative Method: error versus iterations')
xlabel('Iteration, k')
ylabel('Error, ||r_k ||_2')
savefig("Errors_vs_iterations.fig");
hold off;
close;
