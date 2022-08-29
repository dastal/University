
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

%% Exercise 1a


close all
clear all
clc

% definition of domain grid
a=-1;
b= 6;
x=linspace(a,b,1000);

% definition of the function
f = @(x) atan(7*(x-(pi/2)))+sin((x-(pi/2)).^3);
y=f(x);

% definition of the reference axis to find the zeros
y0=zeros(length(x),1);


% Plot
figure(1);
plot(x,y,'b',x,y0,'r')
title('f(x)=atan(7*(x-pi/2))+sin((x-pi/2)^3)')
xlabel('x')
ylabel('y')
legend('y=f(x)','y=0','Location', 'SouthEast')
grid on


