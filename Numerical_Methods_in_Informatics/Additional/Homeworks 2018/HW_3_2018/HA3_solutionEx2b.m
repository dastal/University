
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
%            
%                            SOLUTION 3rd Homework Assignment              
%                            
%                                        in 
%
%                      Numerical Methods for  Scientific Computing
%
%
%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Exercise 2b

close all
clear all
clc

% Initial data for the exercise
a=2;
b= 6;
x=linspace(a,b,1000);
f = @(x) atan(7*(x-(pi/2)))+sin((x-(pi/2)).^3);
df= @(x) 7./(1+49*(x-pi/2).^2)+3*(x-pi/2).^2.*cos((x-pi/2).^3);
alpha=pi/2;
tol=1e-10;

% compute the solution through the biseznewton.m function
nmax_b=1000;
nmax_n=1000;

[xvect, it] = bisectnewton(a,b,nmax_b,nmax_n, tol, f, df);
disp('the final error is:')
disp(abs(xvect(end)-alpha))
