%% Clearing the Environment
clear all;
close all;
clc;

%% Defining the Problem
% Parameters
n = 40;
tau = 4*((n+1)^2/pi^2);     % Upper bound of the eigenvalues
tol = 1.0e-10;
itMax = 2500;

% Initializing x0
x0 = [1:n]';

% Initializing Tn
Tn = 2*eye(n)-diag(ones(n-1,1),-1)-diag(ones(n-1,1),1);
% With the factor
Tn = ((n+1)/pi)^2*Tn;

%% 1b) Computation of the lowest eigenvalue with the Powershift function
[lambda_1,x1,it,lambdas_1,xxs1] = powershift(Tn,tau,tol,itMax,x0);

% Compare with theoretical value
exact_lambda_1 = (2-2*cos(pi/(n+1)))*((n+1)/pi)^2;

% Computing the errors
errors = abs(lambdas_1-exact_lambda_1);

% Compute the convergence ratio
%Second largest eigenvalue of the shift matrix (the second smallest of Tn)
exact_lambda_2 = (2-2*cos(2*pi/(n+1)))*((n+1)/pi)^2;

% Ratio
rate = (exact_lambda_2-tau)/(exact_lambda_1-tau);

%% 1c) Plotting
semilogy(errors,'b','DisplayName','Error on the Eigenvalue');
hold on;
semilogy(rate.^(2*[1:it]),'b:','DisplayName','Expected convergence for \lambda');
title('Error on the eignevalue along the Iteration');
xlabel('Iteration k');
ylabel('Error on \lambda_1^{(k)}');
grid;
legend();
savefig('SL_eigen.fig');
hold off;
close;

%% Additional 1d)
exact_xx = sqrt(2/(n+1))*sin(x0*pi/(n+1));
errors_xx = [];
for i=1:it
    error = min(norm(xxs1(:,i)-exact_xx), norm(xxs1(:,i)+exact_xx));
    % Can have same norm (1) but opposite direction
    errors_xx = [errors_xx error];
end

% Plotting
semilogy(errors_xx,'r','DisplayName','Error on the Eigenvector');
hold on;
factor = 1;
semilogy(rate.^([1:it]),'r:','DisplayName','Expected convergence for x_1');
title('Error on the eigenvalue and eigenvector along the iteration');
xlabel('Iteration k');
ylabel('Error on x_1^{(k)} and \lambda_1^{(k)}');
grid;
legend();
savefig("Error_On_Eigval_and_Eigvec.fig");
hold off;
close;
