
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

%% Exercise 1bc

close all
clear all
clc

% Initial data for the exercise
a=-1;
b= 6;
x=linspace(a,b,1000);
f = @(x) atan(7*(x-(pi/2)))+sin((x-(pi/2)).^3);
alpha=pi/2;


% Check if it is possible to abbly the bisection method

if (f(a)*f(b))<0
    disp('it is possible to apply the bisection method')
    disp(' ')
    nmax_b=1000;
    tol_b=(b-a)/(2^31);
    [xvect, it]=bisect(a,b,tol_b,f);
    err=abs(xvect(end)-alpha);
else
    disp('error: it is NOT possible to apply the bisection method')
end
