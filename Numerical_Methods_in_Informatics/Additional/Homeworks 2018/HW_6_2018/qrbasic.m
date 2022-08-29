function [D]=qrbasic(A,tol,nmax)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [D]=qrbasic(A,tol,nmax)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The method implements the algorithm of iteration QR for the 
% computation of every eigenvalue of a generic matrix A
%
% input:
%   A = matrix to be studied
%   tol = tolerance for the error
%   nmax = maximum number of iterations
%
% output:
%   D =  vector containing the values of the computed eigenvalues
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n=size(A);

T=A;
iter=0;
test=max(max(abs(tril(T,-1))));

while ((iter<=nmax) & (test>=tol))
    [Q,R]=qr(T);
    T=R*Q;
    iter=iter+1;
    test=max(max(abs(tril(T,-1))));
end

if iter>nmax
    fprintf('The method QR does not converge in %d iterations',iter);
else fprintf('The method QR converges in %d iterations', iter);
end

D=diag(T);

return
