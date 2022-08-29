function [xn,k]=sor(A,b,x0,tol,nmax,omega)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Computes the SOR Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [xn,k]=sor(A,b,x0,tol,nmax,omega)
%
%ahaha
% Input: 
%   A = matrix of the system Ax=b
%   b = known term of the system Ax=b
%   x0 = initial guess
%   tol = tolerance for the stop criterion
%   nmax = total number of allowed iterations
%
% Output:
%   xn = solution of the system Ax=b
%   k= total number of performed iterations
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = length(b); % determine length of the system
xn = zeros(n, 1); % initialization of the solution matrix
k = 0;% initialization of iteration counter


% Some preliminary checks on how A has been defined
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (( size(A,1)~=n) || (size(A,2)~=n) || (length(x0) ~= n) )
  error('Inconsistent dimensions')
end

if (prod(diag(A)) == 0)
    error('error: diagonal elements are zero')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xv = x0; % initial guess

L = tril(A); % determine the lower triangular matrix out of A

r =b-A*x0; % residual vector at iteration k
err = norm(r)/norm(b); % Error check

while ( err > tol && k < nmax ) % Check on the error and on the total number of performed iterations
  k = k + 1; % update iteration counter
  z = fwsub_LU(L,r); % Computation of the solution
  xgs = xv + z;  % Compute the solution according to Gauss-Seidel
  xn = (1-omega).*xv + omega.*xgs; % Relaxation
  r = b - A*xn; % residual vector at iteration k
  err = norm(r) / norm(b);  % Error check
  xv = xn; % solution update
end