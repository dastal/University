function [bar] = Barycentric_Formula(nodes,nodesy,x,w)
    %% Explanations:
    % nodes: given by the exercise
    % nodesy: function values of the nodes
    % x: one single value where the function shall be interpolated
    % w: weghts computed in advance
    
    %% Check the length of the weigths and the nodes
    n = length(nodes);
    nw = length(w);
    
    if n~=nw
       error("The nodes and the weigths must have the same lengths!"); 
    end
    
    %% Barycentric Formula
    upper_sum = 0;
    lower_sum = 0;
    
    % Iterate over all x values
    for k=1:n
       % Computing the upper sum
       upper_sum = upper_sum+(w(k)/(x-nodes(k))*nodesy(k));
       
       % Computing the lower sum
       lower_sum = lower_sum+(w(k)/(x-nodes(k)));
    end
    
    % Apply Barycentric formula
    bar = upper_sum/lower_sum;
end

