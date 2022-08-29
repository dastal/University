
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

%% Exercise 3d

% NOTE: to see the three different results use "run and advance" botton 

%% ex 3 d) 1.

clear all
close all
clc

a=-pi/2;
b=pi/2;
tol=10e-10;
nmax=1000;
x0=0.1;
A=0.6;

phi= @(x) x+A*(cos(2*x).^2-x.^2);

figure(1)
[suc,it] = fixedpt(x0,phi,nmax,tol,a,b)
title('Fixed point method for A=0.6 and x_0=0.1')

%% ex 3 d) 2.
clear all
clc


a=-pi/2;
b=pi/2;
tol=10e-10;
nmax=1000;
x0=0.2;
A=0.6;

phi= @(x) x+A*(cos(2*x).^2-x.^2);

figure(2)
[suc,it] = fixedpt(x0,phi,nmax,tol,a,b)
title('Fixed point method for A=0.6 and x_0=0.2')

%% ex 3 d) 3.
clear all
clc


a=-pi/2;
b=pi/2;
tol=10e-10;
nmax=1000;
x0=0.1;
A=0.75;

phi= @(x) x+A*(cos(2*x).^2-x.^2);

figure(3)
[suc,it] = fixedpt(x0,phi,nmax,tol,a,b)
title('Fixed point method for A=0.75 and x_0=0.1')




