function [lambda,xx,iter,lambdas] = power_method(A,tol,itMax,x0)   
    %% Testing matrix A for square property
    [n,m] = size(A);
    if n~=m
        error('Matrix A has to be a square.');
    end
    
    %% Parameters  
    err = 1e10;
    iter = 0;
    xx = x0;
    yy = xx/norm(xx,2);
    
    lambdas = zeros(1,itMax);
    xxs = zeros(n,itMax);

    
    %% Power Method
    while iter<itMax && err>=tol
        
        % calculate new eigenvector
        xx = A*yy;
        yy = xx/norm(xx,2);
        
        % compute new eigenvalue
        lambda = yy'*(A*yy);
        
        % New iteration 
        iter = iter + 1;
        
        xxs(:,iter) = yy; % normalized output for eigenvector estimation
        
        lambdas(iter) = lambda;
        
        if iter > 1
           err = abs(lambdas(iter)-lambdas(iter-1)) / ...
               abs(lambdas(iter));
        end

    end
    lambdas = lambdas(1:iter); % keep only interesting lambdas
    xxs = xxs(:,1:iter);
    xx = yy; % Final normalized xx
end