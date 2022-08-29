function [lambda,x,iter]=invpower(A, tol, nmax,x0)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [lambda,x,iter]=invpower(A,tol,nmax,x0,mu)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The inverse power method
% Approximates the eigenvalue of A of minimum modulus
%
% input:
%   A = matrix to be studied
%   tol = tolerance for the error
%   nmax = maximum number of iterations
%   x0 = initial vector
%
% output:
%   lambda = computed eigenvalue
%   x = computed eigenvector
%   iter = counts the performed iterations
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




[n,m]=size(A);

if n~= m
    error('Matrix has to be a square');
end

% input values if forgotten 
if (nargin==1)
    tol=1.e-6;
    nmax=100;
    x0=ones(n,1);
end

[L,U,P]=lu(A);

iter=0;

x=x0;
y=x/norm(x);

lambda=y'*A*y;
err=tol*abs(lambda)+1;

while ((err>tol*abs(lambda)) && (iter<nmax))
    iter=iter+1;
    
    z=fwsub(L,P*y);
    x=bksub(U,z);
    
    y=x/norm(x);
    
    lambda_new=y'*A*y;
    
    err=abs(lambda_new-lambda);
    lambda=lambda_new;
end

if(err<=tol*abs(lambda))
fprintf('The method of the inverse power converges in %d iterations\n ' , iter);
else
fprintf ('The method of the inverse power does not converge in %d iterations.\n',iter);
end

return

