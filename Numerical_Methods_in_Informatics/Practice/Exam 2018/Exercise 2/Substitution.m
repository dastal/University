function [x] = Substitution(L,U,b)
    % Forward-Backward Substitution
    % LUx=b
    
    % Getting the size of the system
    [n,~] = size(L);
    
    % Initializing
    y = zeros(n,1);
    x = zeros(n,1);
    
    % Forward Substitution
    for i=1:n
        y(i) = (1./L(i,i))*(b(i)-L(i,1:i-1)*y(1:i-1));
    end
    y=y';
    
    % Backward Substitution
    for i=n:-1:1
       x(i) = (1/U(i,i))*(y(i)-U(i,i+1:n)*x(i+1:n)); 
    end
end