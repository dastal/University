function [x , err , iter ]= gaussnewton (r , jr , x0 , tol ,kmax , t, y)
% Solves nonlinear least squares problems using Gauss-Newton method
%
% INPUT:    r       : Defines the system to solve (LS solving)
%           jr      : The Jacobian associated
%           x0      : Initial guess
%           tol     : Tolerance for stopping test
%           kmax    : Maximal number of iteration
%           varargin: Parameters to use in r and jr as secondary inputs
%
% OUTPUT:   x      : Least-Square approximation
%           err    : Estimation of the error on the solution
%           iter   : Number of iteration required

err = tol +1;
k =0;
xk = x0 (:);

rk = r(xk ,t, y);
jrk = jr(xk ,t, y);

while err > tol && k < kmax
    [Q, R]= qr(jrk,0); 
    dk =-R\(Q'*rk);
    xk1 = xk + dk ;
    rk1 = r(xk1,t, y);
    jrk1 = jr(xk1,t, y);
    k = k +1; 
    err = norm( xk1 - xk );
    xk = xk1;
    rk = rk1; 
    jrk = jrk1;

end
x = xk ; iter = k ;
if ( k == kmax && err > tol )
    fprintf (["STOP! Maximum number of iterations reached! \ n "]);
end
end