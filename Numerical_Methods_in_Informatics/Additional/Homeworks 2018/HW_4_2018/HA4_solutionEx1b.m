
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
%            
%                            SOLUTION 4th Homework Assignment              
%                            
%                                        in 
%
%                      Numerical Methods for  Scientific Computing
%
%
%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exercise 1b


close all
clear all
clc


sigma=[0.18 0.3 0.5 0.6 0.72 0.75 0.8 0.9 1.0];
epsilon=[0.0005 0.001 0.0013 0.0015 0.002 0.0045 0.006 0.007 0.0085];

sigma_v=[0.4 0.65];

% Lagrangian polynomial interpolation
epsilon_v_L=lagrange(sigma_v,sigma,epsilon);

% Piecewise linear interpolation degree=1:
epsilon_v_PL1=interp1(sigma,epsilon,sigma_v);

% Least squares interpolation of degree 4:
epsilon_v_LS4=polyval(polyfit(sigma,epsilon,4),sigma_v);

% Cubic spline (PL interpolation degree=3):
epsilon_v_PL3=spline(sigma,epsilon,sigma_v);

fprintf('Sigma:                  %f    %f\n', sigma_v)
fprintf('Epsilon Lagrange:      %f   %f\n',epsilon_v_L)
fprintf('Epsilon Piecewise L.:   %f    %f\n',epsilon_v_PL1)
fprintf('Epsilon Least Sq. 4 :   %f    %f\n',epsilon_v_LS4)
fprintf('Epsilon Cubic Spline:   %f    %f\n',epsilon_v_PL3)


