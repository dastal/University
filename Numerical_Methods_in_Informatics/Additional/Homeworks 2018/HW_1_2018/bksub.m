function x=bksub(A,b)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [x] = bksub(A,b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Algorithm for the backward substitution
%
% Input:
%   A = quadratic upper triangular matrix
%   b = known term
%
% Output:
%   x = solution of the system Ax=b
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


n=length(b); % size of the system of equations 


% Some preliminary checks on how A has been defined
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if((size(A,1)~=n)||(size(A,2)~=n))
  error('ERROR: inconsistent dimensions')
end

if(A~=triu(A))
  error('ERROR: matrix is not upper triangular')
end


if(prod(diag(A))==0)
% if there is a zero element on the diagonal 
  error('ERROR: singular matrix')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Begin of computations
x=zeros(n,1); % initialization of x
x(n) = b(n)/A(n,n); % computation of the last value  to begin the loop

% cycle for the backward substitution
for i=n-1:-1:1
   x(i)=(b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
end





