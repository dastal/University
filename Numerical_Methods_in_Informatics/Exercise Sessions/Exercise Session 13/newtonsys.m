% EXERCISE 1 : Non linear system solving

function [x,res,niter] = newtonsys(Ffun, Jfun, x0, tol, nmax)
% Finds a solution of a nonlinear system using Newton method
%
% INPUT:    Ffun : Defines the system to solve (can be non-linear)
%           Jfun : The Jacobian of Ffun
%           x0   : Initial guess
%           tol  : Tolerance required
%           nmax : Maximal number of iteration
%
% OUTPUT:   x    : Absissa of the zero found
%           res  : Residual
%           niter: Number of iteration required

% Initialisation
niter = 0;
err = tol + 1;
x = x0;

% Computation loop
while err >= tol && niter < nmax
    J = Jfun(x(1),x(2),x(3)); % Jacobian
    F = Ffun(x(1),x(2),x(3));
    delta = - J\F;
    x = x + delta;
    err = norm(delta); % For stopping criterion
    niter = niter + 1;
end
res = norm(Ffun(x(1),x(2),x(3)));
if (niter==nmax && err> tol)
 fprintf(' Fails to converge \n');
end
return
