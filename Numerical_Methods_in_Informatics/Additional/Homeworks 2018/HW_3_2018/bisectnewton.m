function [xvect,it]=bisectnewton(a,b,nmax_b,nmax_n,tol,fun,dfun)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bisection - Newton Method to solve the nonlinear equation f(x)=0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [xvect,it]=bisectnewton(a,b,nmax_b,nmax_n,tol,fun,dfun)
%
% Search for the zero of f(x) on the interval [a,b]
%
% This functin uses the bisection method to get close to the zero and 
% successively the Newton method.
%
% Input:
%   a,b = extrema of the considered interval 
%   nmax_b = number of iterations for the bisection method
%   nmax_n = number of iterations for the newton method
%   tol  = tolerance for the criterion to stop
%   fun  =  function 
%   dfun = derivative of the function fun
%
% Output:
%
%   xvect = vector containing all the iteratives (the last column
%           contains the solution)
%   it    = total (Bisection + Newton) performed iterations
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xvect = [];
it = [];

disp('----------------- Approach of the zero via bisection method ---------------')

% Bisection method
tol_b = ( b - a ) / ( 2^( nmax_b + 1) );
[ xvect_b,  it_b ] = bisect( a, b, tol_b, fun );
it = it_b;
xvect = [ xvect_b ];

disp(' ')
disp(' ')
disp('----------------- Newton method begins ---------------')

% Newton method
xv = xvect( end );
[ xvect_n, it_n ] = newton( xv, nmax_n, tol, fun,dfun);  
it = it + it_n;

xvect = [ xvect; xvect_n( 2 : end ) ];
