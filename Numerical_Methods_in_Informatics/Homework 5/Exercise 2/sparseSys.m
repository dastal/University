%% Clearing Environment
clear all;
close all;
clc;

%% Parameters
% Tolerance
tol = 10^-6;

% Maximum iterations
Nmax = 1000;

% Build sparse matrix A
n = 50;
e = ones(n,3);
% A = full(spdiags([e 2.001*e e],-1:1,n,n)); %-> full matrix
e(:,2) = 2.001;
A = spdiags(e,-1:1,n,n);        % saves a lot of space

% Compute b
xex = transpose(linspace(1,1,n));
b = A*xex;

% Compute intial guess x0
x0 = transpose(10.*sin(100.*[1:n]));

%% Execute the Gauss-Seidel Method
% first call of gaussSeidel with stopCr=0
stopCr = 0;
[xxs0,it0] = gaussSeidel(A,b,x0,tol,Nmax,stopCr);

% first call of gaussSeidel with stopCr=0
stopCr = 1;
[xxs1,it1] = gaussSeidel(A,b,x0,tol,Nmax,stopCr);

% Printing results to screen
resMsg0 = ("Test on the increment normalized: it = " + num2str(it0) + ", err = " + num2str(norm((xxs0(:,it0)-xex))));
disp(resMsg0);

resMsg1 = ("Test on the residual normalized: it = " + num2str(it1) + ", err = " + num2str(norm(xxs1(:,it1)-xex)));
disp(resMsg1);

%% Computing the cheapest approximation of the conditioning number of the system matrix and the spectral radius of the iteration matrix.

% Cheapest approximation of condidioning number of the system matrix
conditionNumber = cond(A,'inf');
condNumMsg = ("The conditioning number of the matrix A is: " + num2str(conditionNumber));
disp(condNumMsg);

% Computing D
D = zeros(n,n);
for i=1:n
   for j=1:n
      if i==j
         D(i,j) = A(i,j); 
      end
   end
end

% Computing E
E = zeros(n,n);
for i=1:n
   for j=1:n
      if i>j
         E(i,j) = -A(i,j); 
      end
   end
end

% Computing P
P = D-E;

% Defining the identity matrix
I = eye(n);

% Computing the iteration matrix
B = I-(P^(-1))*A;

% Spectral Radius of the interation matrix
spectralRadius = max(abs(eig(B)));
specRadMsg = ("The spectral Radius of the iteration matrix is: " + num2str(spectralRadius));
disp(specRadMsg);

%% Plotting the error behaviour of both tests

% computing the error of the first test
error0 = zeros(it0-1,1);
for i=2:it0
   error0(i-1) = norm(xxs0(:,i)-xxs0(:,i-1)); 
end

% intializing xValues for the first test
xValues0 = transpose((2:1:it0));

% computing the error of the second test
error1 = zeros(it1-1,1);
for i=1:it1
   error1(i) = norm(b-A*xxs1(:,i), 2);
end

% intializing xValues for the first test
xValues1 = transpose((1:1:it1));

% Plotting
semilogy(xValues0,error0, '--', 'linewidth', 1.5);
hold on;
semilogy(xValues1,error1, ':', 'linewidth', 1.5);
title("Error Behaviour");
xlabel("x");
ylabel("Error");
legend(["Error on the Increment", "Error on the Residual"]);
savefig("errorBehaviour.fig");
hold off;
close;
