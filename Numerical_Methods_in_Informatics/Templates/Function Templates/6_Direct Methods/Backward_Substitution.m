function [x] = Backward_Substitution(U,y)
    % Getting the size of the system
    [n,~] = size(U);
    
    % Initializing
    x = zeros(n,1);
    
    % Backward Substitution
    for i=n:-1:1
       x(i) = (1/U(i,i))*(y(i)-U(i,i+1:n)*x(i+1:n)); 
    end
end

