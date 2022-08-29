function [lambda,x,iter]=invpowershift(A,mu,tol,nmax,x0)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [lambda,x,iter]=invpowershift(A,tol,nmax,x0,mu)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The inverse power method with shift
% Approximates the eigenvalue of a matrix close to a complex number mu
%
% input:
%   A = matrix to be studied
%   tol = tolerance for the error
%   nmax = maximum number of iterations
%   x0 = initial vector
%   mu = complex number near which the lambda is being looked for
%
% output:
%   lambda = computed eigenvalue
%   x = computed eigenvector
%   iter = counts the performed iterations
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




n=size(A);

% input values if forgotten 
if nargin==2
    tol=1e-6; 
    nmax=1000; 
    x0=ones(n,1);
end


M=A-mu*eye(n);

[L,U,P]=lu(M);

iter=0;
y=x0/norm(x0);

lambda=y'*A*y;
err=tol*abs(lambda)+1;

while ((iter<nmax) && (err>tol*abs(lambda)) && abs(lambda)~=0)
    iter=iter+1;
    
    z=fwsub(L,P*y);
    x=bksub(U,z);
    
    y=x/norm(x);
    lambda_new=y'*A*y;
  
    err=abs(lambda_new-lambda);
    lambda=lambda_new;
end

if (err<=tol*abs(lambda))
fprintf('The inverse power method with shift converges in %d iterations to the eigenvalue ' , iter);
lambda
else
fprintf ('The inverse power method with shift does not converge in %d iterations.\n',iter);
end

return