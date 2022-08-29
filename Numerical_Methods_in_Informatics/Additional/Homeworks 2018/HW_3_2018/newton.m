function [xvect,it]=newton(x0,nmax,tol,fun,dfun)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Newton Method to solve the nonlinear equation f(x)=0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [xvect,it]=newton(x0,nmax,tol,fun,dfun, mol) 
%
% The Newton method is designed to search for the zeros of the function
% fun.
% The test to stop is based on the check of the difference between two
% successive iteratives.
%
%
% Input:
%   x0 = initial guess
%   nmax = maximum number of iterations
%   tol = tolerance for the criterion to stop
%   fun  =  function 
%   dfun = derivative of the function fun
%   mol = if given, permits to apply the modified Newton method
%
% Output:
%
%   xvect = vector containing all the iteratives (the last column
%           contains the solution)
%   it    = performed iterations
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

err = tol + 1;
it = 0;
xvect = [];
xv = x0;

while (it< nmax && err> tol)
   dfx = dfun(xv);
   if dfx == 0
      error(' Stop due to dfun becoming zero');
   else
      xn = xv - fun(xv)/dfx;
      err = abs(xn-xv);
      xvect = [xvect; xn];
      it = it+1;
      xv = xn;
   end
end

if (it < nmax)
    fprintf('Convergence at step k : %d \n',it);
else
    fprintf('The maximum number of allowed iterations k : %d has been reached \n',it);
end
fprintf('Computed root: %-12.8f \n', xvect(end));

