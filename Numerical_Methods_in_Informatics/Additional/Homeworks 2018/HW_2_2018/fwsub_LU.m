 function x=fwsub_LU(A,b)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [x] = fwsub(A,b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Algorithm for the forward substitution
%
% Input:
%   A = quadratic lower triangular matrix
%   b = known term
%
% Output:
%   x = solution of the system Ax=b
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n=length(b); % size of the system of equations 


% Some preliminary checks on how A has been defined
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ((size(A,1)~=n)||(size(A,2)~=n))
  error('ERROR: inconsistent dimensions')
end

if (A~=tril(A))
  error('ERROR: matrix is not lower triangular')
end


if (prod(diag(A))==0)
% if there is a zero element on the diagonal 
  error('ERROR: singular matrix')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Begin of computations
x=zeros(n,1); % initialization of x
x(1)=b(1)/A(1,1); % computation of the first value to begin the loop

% cycle for the forward substitution
for i=2:n
  x(i)=(b(i)-A(i,1:i-1)*x(1:i-1))/A(i,i);
end


