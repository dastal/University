function [L, U, cL, cU] = LU_Factorisation(A)
    % Parameters
    [m,n] = size(A);
    
    % Check if matrix is square
    if m~=n
        error("The matrix must be squared!");
    end
    
    % Check if matrix is singular
    if det(A)==0
        error("The matrix is singular!");
    end
    
    % LU factorization
    for k=1:n-1
       for i=k+1:n
           A(i,k) = A(i,k)/A(k,k);
           for j=k+1:n
               A(i,j) = A(i,j)-A(i,k)*A(k,j);
           end
       end
    end
    U = triu(A);
    L = tril(A);
    L = L-diag(diag(L)) + diag(ones(1,n));

    %compute cL and cU
    cL = cond(L);
    cU = cond(U);
    
    % With Matlab
    % [L,U] = lu(sparse(A));
    % L = full(L);
    % U = full(U);
end

