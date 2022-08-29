function [y] = Forward_Substitution(L,b)
    % Getting the size of the system
    [n,~] = size(L);
    
    % Initializing
    y = zeros(n,1);
    
    % Forward Substitution
    for i=1:n
        y(i) = (1./L(i,i))*(b(i)-L(i,1:i-1)*y(1:i-1));
    end
    y=y';
end

