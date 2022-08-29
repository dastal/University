function [n] = tolerance_series(tolerance)
    % Parameters
    A = (pi^2)/8;
    An = 0;
    n = 1;
    
    % Tolerance Series
    while abs(An-A)>tolerance
        An = An + 1/((2*n-1)^2);
        n = n + 1;
    end
    
    % Remove the last n+1
    n = n - 1;
end

