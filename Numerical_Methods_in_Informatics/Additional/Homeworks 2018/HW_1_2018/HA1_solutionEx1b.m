%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
%            
%                            SOLUTION 1st Homework Assignment              
%                            
%                                        in 
%
%                      Numerical Methods for  Scientific Computing
%
%
%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Exercise 1 b)

clear all
close all
clc

% call of the function pisim.m to compute the value of pi

n=30000000;

format long e

disp('pi computed through function: ')
pi_seq=pisim(n)

disp('pi of Matlab')
pi

abs_e=abs(pi-pi_seq);
rel_e=abs(pi-pi_seq)/abs(pi);

fprintf('Absolute error: %d\n',abs_e);
fprintf('Relative error: %d\n',rel_e);

