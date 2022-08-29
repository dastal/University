function [res,err] = lagr_polynomial(x)
    % unless the instructions in the exercise, I will conduct this exercise
    % as follows:
    % x is a vector containing all the values in the interval
    % res will be a matrix with [phi1(x) phi2(x) phi3(x) L3(x)]
    % err will be a vector containing the actual error at the given point:
    % abs(f(x)-L3(x))
    
    % Parameters
    f = @(x) cos(x);
    nodes = [0; 0.6; 0.9];
    yNodes = f(nodes);
    res = zeros(length(x),4);
    yValues = f(x);
    
    % Lagrangian
    for i=1:length(x)
        sum = 0;
        for k=1:length(nodes)
            prod = 1;
            for j=1:length(nodes)
                if j~=k
                   prod = prod*(x(i)-nodes(j))/(nodes(k)-nodes(j)); 
                end
            end
            res(i,k) = prod;
            sum = sum + yNodes(k)*prod;
        end
        res(i,4) = sum;
    end
    
    % computing error
    err = abs(yValues-res(:,4));    
end

