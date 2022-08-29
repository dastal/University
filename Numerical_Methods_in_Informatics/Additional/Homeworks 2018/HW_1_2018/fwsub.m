function [A,b]=fwsub(A,b)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [x] = fwsub(A,b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Algorithm for the forward substitution
%
% Input:
%   A = quadratic input matrix
%   b = known term
%
% Output:
%   A = quadratic upper triangular matrix
%   b = modified known term
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


for j=1:n-1
    mu=zeros(n,1);
    for i=j+1:n
        if (A(j,j)==0)
            error('Matrix is singular!');
        end;
        
        mu(i)=A(i,j)/A(j,j);
        
        A(i,j:n)=A(i,j:n)-mu(i)*A(j,j:n);
        
        b(i)=b(i)-mu(i)*b(j);
    end
end
