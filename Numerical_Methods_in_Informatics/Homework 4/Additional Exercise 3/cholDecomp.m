function [R, Rt] = cholDecomp(A)
    % Parameters
    [m,n] = size(A);
    R = zeros(m,n);
        
    % Check Size
    if m~=n
        error("The matrix is not square!");
    end
    
    % Check symmertric
    if (any(any(abs(tril(A,-1)'-triu(A,1))>1.d-8)))
        error("The input matrix is not symmetric!");
    end
    
    % Compute R
    R(1,1) = sqrt(A(1,1));
    for j=2:n
        for i=1:(j-1)
            R(i,j) = A(i,j)/R(i,i);
            for k=1:(i-1)
                R(i,j) = R(i,j)-R(k,i)*R(k,j)/R(i,i);
            end
        end
        R(j,j) = A(j,j);
        for k=1:(j-1)
            R(j,j) = R(j,j)-R(k,j)*R(k,j);
        end
        R(j,j) = sqrt(R(j,j));
    end
    
    % Rt is just the transposed matrix
    Rt = R';
end

