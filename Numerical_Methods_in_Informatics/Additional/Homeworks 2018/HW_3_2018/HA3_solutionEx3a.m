
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

%% Exercise 3a

clear all
close all
clc

a=-pi/2;
b=pi/2;
f= @(x) cos(2*x).^2-x.^2;
x=linspace(a,b,1000);



% Plot
figure(1);
plot(x,f(x),x,zeros(size(x)),'r')
title('f(x)=cos(2x)^2-x^2')
xlabel('x')
ylabel('y')
legend('y=f(x)','y=0','Location', 'NorthEast')
grid on

