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


%% Exercise 2)

close all
clear all
clc

N = 50;

I1 = zeros(1,N);
I2 = zeros(1,N);

I1(1) = exp(1)-1;

for n = 2:length(I1)
    
    I1(n) = n*I1(n-1)-1;
    
end

I2(N) = 0;

for n = length(I2):-1:2
    
    I2(n-1) = (I2(n)+1)/n;
    
end

x=linspace(1,50,50);
plot(x,I1,'b',x,I2,'r','LineWidth',2);
title ('Rounding errors propagation')
xlabel('n=1,..50')
ylabel('Integral I')
legend('I_n','I_{n-1}','Location','NorthWest')