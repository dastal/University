function [p,y,error] = Lagrange(degree, x_nodes, y_nodes, x_bar, y_bar)
    %% Takes degree, nodes x and y values, and the wanted x and y
    % Polyfit
    p = polyfit(x_nodes, y_nodes, degree);
    
    % Polyval
    y = polyval(p, x_bar);
    
    % Compute the error
    error = abs(y-y_bar);
    
    % Print the Results
    fprintf("P_2 f(x) = %.2f x^3 + %.2f x^2 + %.2f x + %.2f \n", p(1), p(2), p(3), p(4));
    fprintf("Error at x_bar=0.4: %f \n", error);
end

