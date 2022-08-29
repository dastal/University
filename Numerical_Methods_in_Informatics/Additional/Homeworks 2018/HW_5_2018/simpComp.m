function [I]=simpComp(a,b,N,fun)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [I]=simpComp(a,b,N,fun)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The Simpson quadrature formula
%
% input:
%   a, b = integration domain interval
%   N = number of subintervals
%   fun = function to integrate
%
% output:
%   I = integral of the function fun
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h=(b-a)/N;

x=a:h/2:b;

y=fun(x);

I=(h/6)*(y(1)+2*sum(y(3:2:2*N-1))+4*sum(y(2:2:2*N))+y(2*N+1));