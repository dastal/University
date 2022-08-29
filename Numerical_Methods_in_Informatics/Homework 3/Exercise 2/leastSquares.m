function [aas] = leastSquares(xxs, yys, m)
    % making sure that xxs and yys are column vectors
    xxs = xxs(:);
    yys = yys(:);

    % Vandermonde Matrix
    n = length(xxs);
    A = ones(n,m+1);
    
    for j=1:m
        A(:,j+1) = A(:,j).*xxs;
    end
    
    B = transpose(A)*A;
    
    % y Vector
    y = transpose(A)*yys;
    
    aas = B\y;
end
