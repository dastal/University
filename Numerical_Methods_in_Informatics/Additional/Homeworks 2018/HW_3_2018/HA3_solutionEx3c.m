
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

%% Exercise 3c

clear all
close all
clc

% To check the values for A where we have convergence:

% 1) compute the derivative 
df = @(x) -4*cos(2*x).*sin(2*x)-2*x;

% 2) 
% we have to recall what we computed in 3b)
a=-pi/2;
b=pi/2;
tol=10e-10;
nmax=1000;
x0=0.1;
phi= @(x) x+0.1*(cos(2*x).^2-x.^2);
[suc,it] = fixedpt(x0,phi,nmax,tol,a,b);
close all % we don't need to display again the plot

% evaluate the derivative for the computed solution
df_a=df(suc(end));

% 3) due to Ostrowski we have |phi'(alpha)|<2, which in this case gives: 
% 0<A< -2/f'(alpha)

A_sup= -2/(df_a)

% we see that A_sup= 0.7154. This means that the method converges for 
% alpha>0 for: 0<A<0.7154

