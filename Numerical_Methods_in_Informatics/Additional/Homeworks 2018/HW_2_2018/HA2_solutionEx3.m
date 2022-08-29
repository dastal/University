
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
%            
%                            SOLUTION 2nd Homework Assignment              
%                            
%                                        in 
%
%                      Numerical Methods for  Scientific Computing
%
%
%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Exercise 3

clear all
close all
clc

format short

% From Ex 2a)
n=7;

A=diag(9*ones(1,n))+diag(-3*ones(1,n-1),1)+diag(-3*ones(1,n-1),-1)+...
    diag(ones(1,n-2),2)+diag(ones(1,n-2),-2);
b=[7 4 5 5 5 4 7]';

% Ex 3a)
% See file gs.m

% Ex 3b)
tol=1e-6;
x0=zeros(n,1);
nmax=1000;

[x_gs,k_gs]=gs(A,b,x0,tol,nmax)

%Ex 3c)
[x_jac,k_jac]=jacobi(A,b,x0,tol,nmax);
k_jac

% The solution x_jac obtained via the Jacobi method is the same as x_gs
% obtained through the Gauss-Seidel method.
%
% For the Jacobian method the necessary iterations are more than those
% needed by the Gauss-Seidel method.
% This difference is because the spectral radius of the iterative matrix in the Jacobi method is
% greater than that of the Gauss Seidel one. 
% This is possible to be checked doing the following: 
% 
Dinv=diag(1./diag(A));
Bj=eye(n)-Dinv*A;

T=tril(A);
Bgs=eye(n)-inv(T)*A;

rho_j=max(abs(eig(Bj)))
rho_gs=max(abs(eig(Bgs)))


% To obtain an estimate of the necessary iterations to abolish the error:
etimate_k_j=log(tol)/log(rho_j)
estimate_k_gs=log(tol)/log(rho_gs)


% 
