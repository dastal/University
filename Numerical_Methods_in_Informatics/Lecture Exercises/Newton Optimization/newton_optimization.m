function [x,res,niter] = newton_optimization(Gfun, Hfun, x0, tol, nmax)
% Finds a solution of a nonlinear system using Newton method
%
% INPUT:    Ffun : Defines the system to solve (can be non-linear)
%           Hfun : The Hessian of Ffun
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
    H = Hfun(x(1),x(2)); % Jacobian
    G = Gfun(x(1),x(2));
    delta = - H\G;
    x = x + delta;
    err = norm(delta); % For stopping criterion
    niter = niter + 1;
end
res = norm(Gfun(x(1),x(2)));
if (niter==nmax && err> tol)
 fprintf(' Fails to converge \n');
end
return
