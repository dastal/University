function [t_h,u_h,iter_fp]=CrankNic(f,t_max,y_0,h)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [t_h,u_h,iter_fp]=CrankNic(f,t_max,y_0,h)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The method implements the Crank Nicolson method for solving ODE problems
%
% input:
%   f = function in two variables f(t,y)
%   t_max = last value of the considered time domain
%   y_0 = initial value
%   h = time step
%
% output:
%   t_h =  vector with the discrete time, e.g. the time domain grid
%   u_h = vector of computed solutions 
%   iter_fp =  vector  containing the iterations performed by the fixed point method at each time step 
%              for the resolution of the non-linear problem.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





t0=0;
t_h=t0:h:t_max;


N_instant=length(t_h);
u_h=zeros(1,N_instant);

% Iterative cycle that computes uˆ{n+1}=uˆn+1/2*h*( fˆn +fˆ{n+1}) .
% At each temporal iteration i compute subiterations via the fixed point method to compute uˆ{n+1}:
%
% u (n+1)ˆ(k+1) = u n + h/2*( fˆn + f ( t (n+1) , u (n+1)ˆk ) ).

u_h(1)=y_0;

% parameters for the fixed point method:
N_max=100;
tol=1e-5;
iter_fp=zeros(1,N_instant);

for it=2:N_instant
    
    u_old=u_h(it-1);
    f_old=f(t_h(it-1),u_old);
    t_fp=t_h(it);
    phi=@(u) u_old + 0.5*h*(f_old + f(t_fp,u));
    
    
    % subiterations
    [u_fp,it_fp]=fixedpt(u_old,phi,N_max,tol,t0,t_max);
    u_h(it)=u_fp(end);
    
    iter_fp(it)=it_fp;
end


