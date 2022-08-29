function [I]=gaussComp(a,b,N,fun)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [I]=gaussComp(a,b,N,fun)
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

x=a:h:b; % Vector containing the integration nodes
xm=a+h/2:h:b; % vector of the midpoints of the subintervals

x1=xm-h/(2*sqrt(3)); 
y1=fun(x1);

I=h/2*sum(y1); % first part of the integral

x2=xm+h/(2*sqrt(3)); 
y2=fun(x2);

I=I+h/2*sum(y2); % second part of the integral