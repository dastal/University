function [phi] = Lagrangian_Characteristics_simple(nodes, x)
    %% Delivers Lagrangian Characteristic Polynomials for function Lagrangian_Formula
    % Parameters
    n = length(nodes);
    phi = zeros(n,1);
    
    % Lagrange
    % Loop over the characteristic funtions, generate the kth function
    for k=1:n
        prod = 1;
        for j=1:n
           if j~=k
               prod = prod*(x-nodes(j))/(nodes(k)-nodes(j));
           end
        end
        phi(k) = prod;
    end
end
