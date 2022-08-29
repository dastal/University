
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

%% Exercise 4


clear all
close all
clc

% Ex 4a)
% see script sor.m

% Ex 4b)
n=7;

A=diag(9*ones(1,n))+diag(-3*ones(1,n-1),1)+diag(-3*ones(1,n-1),-1)+...
    diag(ones(1,n-2),2)+diag(ones(1,n-2),-2);
b=[7 4 5 5 5 4 7]';

tol=1e-6;
x0=zeros(n,1);
nmax=1000;
omega=1.2;
[x_sor,k]=sor(A,b,x0,tol,nmax,omega)



%% Ex 4c) Bonus Point -- uncomment to launch
%sol=[];
%k_sor_optimal=nmax;
%for i=0.1:0.1:1.99
%    omega=i;
%    [x_sor,k_sor]=sor(A,b,x0,tol,nmax,omega);
%    
%    if k_sor < k_sor_optimal
%        k_sor_optimal = k_sor;
%        optimal_omega = omega;
%    end
%end

