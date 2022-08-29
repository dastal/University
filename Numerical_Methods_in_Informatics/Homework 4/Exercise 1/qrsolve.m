function [Q, R] = qrsolve(A)
    % parameters
    [m,n] = size(A);
    Q = zeros(m);
    R = zeros(m);
    
    % check if matrix is square
    if m ~= n
        error("The matrix is not square!");
    end
        
    % QR decomposition
    for j = 1:n
       % Take j column
       Q(:,j) = A(:,j);
       for i = 1:j-1
           % Orthogonalize q_j wrt q_i
          R(i,j) = sum(Q(:,j).*Q(:,i));
          Q(:,j) = Q(:,j)-R(i,j)*Q(:,i);
       end
       % Diagonal element
       R(j,j) = sqrt(sum(Q(:,j).^2));
       % Normalize q_j
       Q(:,j) = Q(:,j)/R(j,j);
    end
end

