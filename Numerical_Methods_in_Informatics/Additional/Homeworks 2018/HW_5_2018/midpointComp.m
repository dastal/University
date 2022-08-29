function [I]=midpointComp(a,b,N,fun)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [I]=midpointComp(a,b,N,fun)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The midpoint quadrature formula
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

x=[a+h/2:h:b-h/2]; %vector containing midpoint values

I=h*sum(fun(x));
