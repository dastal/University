function [x,it] = itermeth(A,b,x0,tol)
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
    
    %% Gauss-Seidel method
    while err>tol && it<itMax
         x_new = zeros(n,1);
         for i=1:n
            % initializing the sums
            sum1 = 0;
            sum2 = 0;

            % first sum of the component-wise formula
            for j=1:(i-1)
                sum1 = sum1+A(i,j)*x_new(j);
            end

            % second sum of the component-wise formula
            for j=(i+1):n
                sum2 = sum2+A(i,j)*x(j);
            end

            % computing the new component
            x_new(i) = (1/A(i,i))*(b(i)-sum1-sum2);
        end
        err = norm(x_new-x);
        x = x_new;
        it = it+1;
    end
    
    % Printing the spectral Radius of the iteration Matrix
    spectral_Radius = max(abs(eig(A)));
    fprintf("The spectral Radius of the iteration Matrix is %f.\n",spectral_Radius);
end
