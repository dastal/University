function [theta, theta_vec, niter] = Newton_Gauss_param(theta0, b, Ffun, Jfun, Maxiter, tol)
% Finds the least-square approximation of a (overconstrained nonlinear
% system using Gauss-Newton method
%
% INPUT:    theta0 : Initial guess
%           b      : Right hand term
%           Ffun   : Defines the system to solve
%           Jfun   : The Jacobian associated
%           Maxiter: Maximal number of iteration
%           tol    : Tolerance required
%
% OUTPUT:   theta      : Least-Square approximation
%           theta_vec  : History of the approximated solution
%           niter      : Number of iteration required

% Initialisation
niter = 0;
err = tol + 1;
theta = theta0;
theta_vec = [theta0];

while err > tol && niter < Maxiter
    J  = Jfun(theta);
    F  = Ffun(theta);
    JJ = J'*J; % New left hand matrix
    res  = b - F; %Residual of the system
    Jres = J'*res; % New right hand term
    delta_t = JJ\ Jres ;
    theta = theta + delta_t;
    theta_vec = [theta_vec, theta];
    niter = niter + 1;
    err = norm( theta_vec(end)-theta_vec(end-1) );
end


end