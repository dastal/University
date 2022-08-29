function [lambda,iter,err] = inversePower(A,x0,itMax,tol)
    %% Parameters
    % Intitalize the error
    err = tol+1;
    
    % Initialize the iteration parameter
    iter = 0;
    
    % Hand over x
    x = x0;
    
    %% Inverse Power Method
    % Compute the first y
    y = x/norm(x);
    
    % Compute the first step
    lambda = y'*x;
    
    % Increase the iteration
    iter = iter+1;
    
    % Enter the loop
    while err>tol && iter<itMax
       lambda_old = lambda;
       x = A^-1*y;
       y = x/norm(x);
       lambda = y'*x;
       % Computing the error
       err = abs(lambda^-1 - lambda_old^-1);
       
       % Increase iter
       iter = iter+1;
    end
end
