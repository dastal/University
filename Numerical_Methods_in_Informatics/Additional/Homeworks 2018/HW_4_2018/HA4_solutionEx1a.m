
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
%% Exercise 1


close all
clear all
clc


% Ex 1a)

sigma=[0.18 0.3 0.5 0.6 0.72 0.75 0.8 0.9 1.0];
epsilon=[0.0005 0.001 0.0013 0.0015 0.002 0.0045 0.006 0.007 0.0085];

% plot of the experimental data
figure(1)
plot(sigma,epsilon,'ko')
title('Experimental Data')
xlabel('stress')
ylabel('strain')

% nodes on which interpolation is performed
sigma_dis=linspace(min(sigma),max(sigma),1000);

% Lagrangian polynomial interpolation
epsilon_L=lagrange(sigma_dis,sigma,epsilon)

% figure(2)
% plot(sigma, epsilon, 'ko', sigma_dis, epsilon_L,'r','linewidth',2)
% xlabel('stress')
% ylabel('strain')
% title('Experimental Data vs Lagrange interpolation')
% 
% % Piecewise linear interpolation degree=1:
% epsilon_PL1=interp1(sigma,epsilon,sigma_dis);
% 
% figure(3)
% plot(sigma, epsilon,'ko', sigma_dis, epsilon_PL1,'r','linewidth',2)
% xlabel('stress')
% ylabel('strain')
% title('Experimental Data vs Piecewise Linear Interpolation')
% 
% 
% % Least squares interpolation of degree 1,2,4:
% epsilon_LS1=polyval(polyfit(sigma,epsilon,1),sigma_dis);
% epsilon_LS2=polyval(polyfit(sigma,epsilon,2),sigma_dis);
% epsilon_LS4=polyval(polyfit(sigma,epsilon,4),sigma_dis);
% 
% figure(4)
% plot(sigma, epsilon,'ko', sigma_dis, epsilon_LS1,sigma_dis, epsilon_LS2,sigma_dis, epsilon_LS4,'linewidth',2)
% xlabel('stress')
% ylabel('strain')
% title('Experimental Data vs Least Squares Interpolation')
% legend('Experimental Data','Least Squares: 1','Least Squares: 2','Least Squares: 4',2)
% 
% % Cubic spline (PL interpolation degree=3):
% epsilon_PL3=spline(sigma,epsilon,sigma_dis);
% 
% figure(5)
% plot(sigma, epsilon,'ko', sigma_dis, epsilon_PL3,'r','linewidth',2)
% xlabel('stress')
% ylabel('strain')
% title('Experimental Data vs Cubic Spline Interpolation')
% 
% % Complete plot
% figure(6)
% plot(sigma, epsilon,'ko', sigma_dis, epsilon_L,sigma_dis, epsilon_PL1,sigma_dis, epsilon_LS4,sigma_dis, epsilon_PL3,'linewidth',2)
% ylim([-2e-3 1e-2])
% xlabel('stress')
% ylabel('strain')
% title('Experimental Data vs Interpolation Methods')
% legend('Experimental Data','Lagrange','Piecewise Lin.','Least Squares: 4','Cubic Spline',4)
% 
% 
