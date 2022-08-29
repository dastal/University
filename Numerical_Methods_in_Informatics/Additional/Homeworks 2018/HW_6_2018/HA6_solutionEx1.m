
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
%            
%                            SOLUTION 6th Homework Assignment              
%                            
%                                        in 
%
%                      Numerical Methods for  Scientific Computing
%
%
%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Exercise 1
clc
clear all
close all

B=[10 -1 1 0; 
    1 1 -1 3;
    2 0 2 -1;
    3 0 1 5];

%Ex 1 a)
gershcircles(B)

figure(3)
gershcircles_mod(B)

% Ex 1b)

eig(B)

% Ex 1c)
%see invpower.m

% Ex 1d)
[lambda,x,iter]=invpower(B,1e-6,1000,ones(4,1));

% Ex 1e)
% see invpowershift.m

% Ex 1f)
[lambda,x,iter]=invpowershift(B,i,1e-6,1000,ones(4,1));

% 
[lambda,x,iter]=invpowershift(B,-i,1e-6,1000,ones(4,1));
% The method converges in 42 iterations to the eigenvalue
% lambda=1.3509-0.4554i

% Ex 1g)
[lambda,x,iter]=invpowershift(B,12,1e-6,1000,ones(4,1));
