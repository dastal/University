function [phi] = LagranCharPoly(nodes, x)
    % Parameters
    n = length(nodes);
    nX = length(x);
    phi = ones(nX, n);
    
    % Lagrange
    % Loop over the characteristic funtions, generate the kth function
    for k=1:n
        % Looping over the terms that are involved in my characteristic
        % polynomial
        for j=1:n
           % Excluding the kth term and updating the values at hte evaluated points
           if j~=k
               phi(:,k) = phi(:,k).*(x'-nodes(j))/(nodes(k)-nodes(j));
           end
        end
    end
end

