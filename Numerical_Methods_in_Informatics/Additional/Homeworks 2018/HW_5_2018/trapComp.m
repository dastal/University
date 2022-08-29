function [I]=trapComp(a,b,N,fun)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [I]=trapComp(a,b,N,fun)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The trapezoidal quadrature formula
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

x=a:h:b; % vector with integration nodes

y=fun(x);

I=h*(0.5*y(1)+sum(y(2:N))+0.5*y(N+1));
