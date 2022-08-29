
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
%            
%                            SOLUTION 5th Homework Assignment              
%                            
%                                        in 
%
%                      Numerical Methods for  Scientific Computing
%
%
%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Exercise 2

clc
clear all
close all

a=0;
b=0.8;
x_dis=linspace(a,b,1000);
f = @(x) cosh(x-0.5);
y_dis=f(x_dis);

% Ex 2a)
% see gaussComp.m

% Ex 2b)
N=1:20;

f_int=@(z) pi*(f(z)).^2;

%I=integral(f_int,a,b)

V_ex=2.679664474685;

V_GC=zeros(1,N(end));
V_TC=zeros(1,N(end));
V_SC=zeros(1,N(end));


for i = N
    V_GC(i) = gaussComp(a,b,i,f_int);
    V_TC(i) = trapComp(a,b,i,f_int);
    V_SC(i) = simpComp(a,b,i,f_int);
end

figure(2)
plot(N, V_TC,'o', N,V_SC,'d',N, V_GC,'*',N,V_ex*ones(1,20));
grid on
legend('Trapezoidal', 'Simpson','Gauss','V',1)
title('Comparison composite quadrature formula II')
xlabel('number of sub-intervals')
ylabel('approximated integral')


% Ex 2c)

err_GC=abs(V_ex-V_GC);
err_TC=abs(V_ex-V_TC);
err_SC=abs(V_ex-V_SC);

H=(b-a)./N;

figure(3);

loglog(H,err_TC,'o', H, err_SC,'d',H,err_GC, '*',H,H.^2, H,H.^4)
legend('err-TC','err-SC','err-GC', 'H^2','H^4',2)

title('Quadrature error in logarithmic scale')
xlabel('Amplitude of the intervals')
ylabel('Error')
