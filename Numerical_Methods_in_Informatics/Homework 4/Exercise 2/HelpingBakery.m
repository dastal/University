%% Clearing Environment
clear all;
close all;
clc;

%% Solve the initial non-pertubed problem
% Parameters

% Correct matrix:
% (Required Material Units')*created Sweets = Required total Material
% A*b = x
Ingredients =   [10, 7, 8, 7;      % eggs
                7, 5, 6, 5;        % flower
                8, 6, 10, 9;       % cinamon
                7, 5, 9, 10];      % milk
%       Gipfeli Strudel Luxemburgerli Yogurt

% Computing A
A = (inv(Ingredients'));

% Defining the number of sweets the school wishes
b = [32; 23; 33; 31];

% Solving the problem
[L,U,cL,cU] = GetLU(A);
x = Substitution(L,U,b);

% Printing the results
fprintf("For the initial problem: \nThe required quantity of the Eggs is: " + num2str(x(1)) + "\nThe required quantity of the Cinnamon is: " + num2str(x(2)) + "\nThe required quantity of the Flower is: " + num2str(x(3)) + "\nThe required quantity of Milk is: " + num2str(x(4)) + "\n\n");

%% Solving the pertubed problem
% Again the ingredients Matrix
Ingredients =   [10, 7, 8, 7;
                7, 5, 6, 5;
                8, 6, 10, 9;
                7, 5, 9, 10];

% Computing A
A = (inv(Ingredients'));

% Optimization
deltaA = [0, 0, 0.1, 0.2;
          0.08, 0.04, 0, 0;
          0, -0.02, -0.11, 0;
          -0.01, -0.01, 0, -0.02];

% Optimized Matrix
Aopt = A+deltaA;

% Solving the problem
[L2,U2,cL2,cU2] = GetLU(Aopt);
y = Substitution(L2,U2,b);

% Printing the results
fprintf("For the pertubed problem: \nThe required quantity of the Eggs is: " + num2str(y(1)) + "\nThe required quantity of the Cinnamon is: " + num2str(y(2)) + "\nThe required quantity of the Flower is: " + num2str(y(3)) + "\nThe required quantity of Milk is: " + num2str(y(4)) + "\n\n");

% Computing amplification error estimate E1
E1 = norm(y-x)/norm(y)*(norm(deltaA)/norm(A))^(-1);

% Computing conditioning Number of A
cA = cond(A);

% Printing the Error
fprintf("The error E1 for the perturbed problem is: " + num2str(E1) + ". \nThe conditioning number of A is: " + num2str(cA) + ".\n\n");

% The amplification error is huge and so the computation is not reliable.
% But: The amplification error is still lower than the conditioning number
% -> A huge conditioning number means that the amplification error will be
% very bad. This implies that the LU factorisation is not fitting for this
% problem.

% -> We cannot rely on the changes the bakery did.

%% Solving the b pertubed problem
% Again the ingredients Matrix
Ingredients =   [10, 7, 8, 7;
                7, 5, 6, 5;
                8, 6, 10, 9;
                7, 5, 9, 10];

% Computing A
A = (inv(Ingredients'));

% Optimized b vector
bTilde = [32.1; 22.99; 33.01; 30.9];

% Solving the problem 
[L3,U3,cL3,cU3] = GetLU(A);
z = Substitution(L3,U3,bTilde);

% Printing the results
fprintf("For the pertubed problem: \nThe required quantity of the Eggs is: " + num2str(z(1)) + "\nThe required quantity of the Cinnamon is: " + num2str(z(2)) + "\nThe required quantity of the Flower is: " + num2str(z(3)) + "\nThe required quantity of Milk is: " + num2str(z(4)) + "\n\n");

% Computing amplification error estimate E2
E2 = (norm(z-x)/norm(x))*(norm(b-bTilde)/norm(b))^(-1);

% Computing conditioning Number of A
cA = cond(A);

% Printing the error
fprintf("The amplification error E2 for the perturbed problem is: " + num2str(E2) + ". \nThe conditioning number of A is: " + num2str(cA) + ".\n\n");

%% Part not to be submitted: Computing the LU-factorization of A

% First Question
% Retrieving cL and cU
fprintf("Part not to be submitted:\n");
fprintf("The conditioning number of L is: " + num2str(cL) + "\n");
fprintf("The conditioning number of U is: " + num2str(cU) + "\n");
fprintf("The conditioning number of A is: " + num2str(cA) + "\n");

% Since cU>cL, the problem is most likely situated in the upper tridiagonal Matrix.
% Since cU is very big, U is bad conditioned

% Second question:
% Better reliability?
% Yes, solving a badly conditioned system by only inverting the matrix is
% still worse than using the LU factorization.
