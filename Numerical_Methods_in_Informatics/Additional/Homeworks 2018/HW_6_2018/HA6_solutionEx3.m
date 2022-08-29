
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
%            
%                            SOLUTION 6th Homework Assignment              
%                            
%                                        in 
%
%                      Numerical Methods for  Scientific Computing
%
%
%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Exercise 3

clear all
close all
clc

% Ex 3a)
% see CrankNic.m

% Ex 3b)
y0=2;
lambda=-42;
t_max=1;
h=0.02;

t_plot=0:0.01:t_max;

y=@(x) y0*exp(lambda*x);
f=@(t,y) lambda*y;

[CN_t_h, CN_u_h,iter_pf]=CrankNic(f,t_max,y0,h);

plot(t_plot,y(t_plot),'k', 'LineWidth',2);
hold on 
plot(CN_t_h, CN_u_h,'o', 'MarkerSize',4);
legend ('analytic solution', 'CN with h=0.02',2);
xlabel('t')
ylabel('y(t)')
title('Comparison between exact and computed solution')

figure;
plot(iter_pf,'o:','MarkerSize',4)

% Ex 3c)
N=5;
halfstep=2.^(1:N);
steps=0.04./halfstep;

for it=1:N
    
    [CN_t_h, CN_u_h]=CrankNic(f,t_max,y0,steps(it));
    y_h=y(0:steps(it): t_max);
    error_CN(it)=max(abs(y_h)-CN_u_h);
end

figure;
loglog(steps, error_CN,'-ob','LineWidth',2);
hold on 
plot(steps,steps,'k')
plot(steps, (steps).^2,'k:')
legend('error CN', '1st order', '2nd order', 2);
xlabel('h')
ylabel('err(h)')
title('Error of Crank Nicolson according to the chosen time step')









