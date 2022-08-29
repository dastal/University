%% Clearing the Environment
clear all;
close all;
clc;

%% Parameters
% number of equidistant points
points = 101;

% Matrix for condition numbers
% Structure
% 1: cond(A), 2: cond(Q), 3: cond(R), 4: cond(L), 5: cond(U)
conditionNumbers = zeros(points,5);

% Initialize the vector with the epsilon values
epsilon = (0:0.005:0.5);

%% Computing the condition numbers

for i = 1:points
    % Build A
    A = [epsilon(i) 1; 1 1];
    
    % Compute condition number of A in the infinity norm
    conditionNumbers(i,1) = cond(A, Inf);
    
    % QR Decomposition
    [Q,R] = qr(A);
    
    % Compute condition number of Q and R in the infinity norm
    conditionNumbers(i,2) = cond(Q, Inf);
    conditionNumbers(i,3) = cond(R, Inf);
    
    % LU Factorization
    [L,U] = lu_nopivoting(A);
    
    % Compute condition number of L and U in the infinity norm
    conditionNumbers(i,4) = cond(L, Inf);
    conditionNumbers(i,5) = cond(U, Inf);
end

%% Plotting
plot(epsilon, conditionNumbers(:,1));
hold on;
for i=2:5
   plot(epsilon, conditionNumbers(:,i));
end
legend({'Condition Numbers of A', 'Condition Numbers of Q', 'Condition Numbers of R', 'Condition Numbers of L', 'Condition Numbers of U'},'Location','northeast')
title('Condition Numbers of A,Q,R,L and U with Alternating Epsilon');
xlabel('0 < n < 0.5');
ylabel('Condition Number');
xlim([-0.01 0.52]);
ylim([-0.1*10^4 4.1*10^4]);
savefig('ex_condition.fig');
hold off;
close;

%% Additional Point
% First Problem
% Intializing the first matrix
A1 = [11, 10, 14;
      12, 11, -13;
      14, 13, -66];

% Initializing the solution vector
b = [1; 1; 1];

% LU-factorization
[L1,U1] = lu_nopivoting(A1);
x1 = Substitution(L1,U1,b);

disp("The resulting vector of the first problem is: ");
disp(x1);

% Second Problem
% Intializing the second matrix
A2 = [11, 10, 14;
      12, 11.01, -13;
      14, 13, -66];
  
% LU-factorization
[L2,U2] = lu_nopivoting(A2);
x2 = Substitution(L2,U2,b);

disp("The resulting vector of the second problem is: ");
disp(x2);

% Third Problem
% Initializing third matrix
% Intializing the first matrix
A3 = [11, 10, 14;
      12, 11, -13;
      14, 13, -66];

% Initializing the pertubed solution vector
bTilde = [1.001; 1.001; 1.001];

% LU-factorization
[L3,U3] = lu_nopivoting(A3);
x3 = Substitution(L3,U3,bTilde);

disp("The resulting vector of the first problem is: ");
disp(x3);

fprintf("The condition number of the first matrix is: " + num2str(cond(A1)) + "\n");
fprintf("The condition number of the second matrix is: " + num2str(cond(A2)) + "\n");

% The system is extremely bad conditioned.