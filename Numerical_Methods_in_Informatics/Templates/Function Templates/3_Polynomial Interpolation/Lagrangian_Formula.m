function [lagr] = Lagrangian_Formula(phi,y)
    %% Explanations:
    % nodes: given by the exercise
    % nodesy: function values of the nodes
    % x: one single value where the function shall be interpolated
    % phi: Lagrangian characteristic polynomials computed in advance
    %% Parameters
    n = length(y);
    
    %% Lagrangian Form
    lagr = 0;
    
    % Iterate over all the values
    for k=1:n
        lagr = lagr + y(k)*phi(k);
    end
end

