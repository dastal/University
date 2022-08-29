
function [x,k]=jacobi(A,b,x0,tol,nmax)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Computes the Jacobi Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [x,k]=jacobi(A,b,x0,tol,nmax)
%
%
% Input: 
%   A = matrix of the system Ax=b
%   b = known term of the system Ax=b
%   x0 = initial guess
%   tol = tolerance for the stop criterion
%   nmax = total number of allowed iterations
%
% Output:
%   x = solution of the system Ax=b
%   k= total number of performed iterations
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% definition of the diagonal matrix given by the diagonal elements of A
Dinv=diag(1./diag(A));

n=length(b); % determine length of the system

x=zeros(n,1); % initialization of the solution matrix
k=0; % initialization of iteration counter

x=x0; % initial guess

r=b-A*x0; % residual vector at iteration k
err=norm(r)/norm(b); % Error check

while (err>tol && k<nmax) % Check on the error and on the total number of performed iterations
    k=k+1; % update iteration counter
    z=Dinv*r; % preconditioned residual z
    x=x+z; % new iterate
    r=b-A*x; % residual vector at iteration k
    err=norm(r)/norm(b); % Error check
end



