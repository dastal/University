function [w] = Barycentric_Weights(nodes)
    %% Parameters
    % Length
    n = length(nodes);
    
    % Array to store the weights
    w = zeros(n,1);
    
    %% Compute the weigths
    for k=1:n
       prod = 1;
       for j=1:n
          if j~=k
              prod = prod*(nodes(k)-nodes(j));
          end
       end
       w(k) = prod^-1;
    end
end
