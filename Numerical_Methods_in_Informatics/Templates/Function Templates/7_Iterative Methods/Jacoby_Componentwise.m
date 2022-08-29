function [x,it] = Jacoby_Componentwise(A,b,x0,tol)
    %% Parameters
    % Take the length of matrix A
    n = length(A);
    
    % Define the Maximum iterations
    itMax = 500;
    
    % Initialize iterization parameter
    it = 0;
    
    % Initialize the error
    err = tol+1;
    
    % Hand over x0 to x
    x = x0;
    
    %% Jacoby method
    while err>tol && it<itMax
         x_new = zeros(n,1);
         for i=1:n
            % initializing the sums
            sum = 0;

            % sum of the component-wise formula
            for j=1:n
                if j~=i
                    sum = sum+(A(i,j)*x(j));
                end
            end

            % computing the new component
            x_new(i) = (1/A(i,i))*(b(i)-sum);
        end
        err = norm(x_new-x);
        x = x_new;
        it = it+1;
    end
    
    % Printing the condition Number of the iteration Matrix
    fprintf("The condition number of the iteration Matrix is K(A)=%f.\n",cond(A));
end
