
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

%% Exercise 1


close all
clear all
clc

a=0;
b=0.8;
x_dis=linspace(a,b,1000);
f = @(x) cosh(x-0.5);
y_dis=f(x_dis);

% Ex 1a

% Plot of the function
plot(x_dis,y_dis,'r')
xlabel('x')
ylabel('f(x)')
title('f(x)=cosh(x-0.5)')
ylim([0 1.5])

% Ex 1b
% see midpointComp.m

%
% Ex 1c
% see trapComp.m

%

% Ex 1d
% see simpComp.m

% Ex 1e
N=1:20;

f_int=@(z) pi*(f(z)).^2;

%I=integral(f_int,a,b)

V_ex=2.679664474685;

V_MPC=zeros(1,N(end));
V_TC=zeros(1,N(end));
V_SC=zeros(1,N(end));


for i = N
    V_MPC(i) = midpointComp(a,b,i,f_int);
    V_TC(i) = trapComp(a,b,i,f_int);
    V_SC(i) = simpComp(a,b,i,f_int);
end

figure(2)
plot(N, V_MPC,'*', N, V_TC,'o', N,V_SC,'d',N,V_ex*ones(1,20));
grid on
legend('Midpoint', 'Trapezoidal', 'Simpson','V',1)
title('Comparison composite quadrature formula')
xlabel('number of sub-intervals')
ylabel('approximated integral')


% Ex 1f)

err_MPC=abs(V_ex-V_MPC);
err_TC=abs(V_ex-V_TC);
err_SC=abs(V_ex-V_SC);

H=(b-a)./N;

figure(3);

loglog(H,err_MPC, '*', H,err_TC,'o', H, err_SC,'d',H,H.^2, H,H.^4)
legend('err-MPC','err-TC','err-SC', 'H^2','H^4',2)

title('Quadrature error in logarithmic scale')
xlabel('Amplitude of the intervals')
ylabel('Error')



% Ex 1g)

tol=1e-5;

d2f_int=@(x) 2*pi*(2*(cosh(x-0.5)).^2-1);
d4f_int= @(x) 8*pi*(2*(cosh(x-0.5)).^2-1);

K2=max(abs(d2f_int(x_dis)));
K4=max(abs(d4f_int(x_dis)));

Nmpc=ceil(sqrt(((b-a)^3*K2)/(24*tol)))
Ntc=ceil(sqrt(((b-a)^3*K2)/(12*tol)))
Nsc=ceil((((b-a)^5*K4)/(2880*tol))^(1/4))

VMP=midpointComp(a,b,Nmpc,f_int);
errMPCreal=abs(V_ex-VMP)

VTC=trapComp(a,b,Ntc,f_int);
errTCreal=abs(V_ex-VTC)

VSC=simpComp(a,b,Nsc,f_int);
errSCreal=abs(V_ex-VSC)








