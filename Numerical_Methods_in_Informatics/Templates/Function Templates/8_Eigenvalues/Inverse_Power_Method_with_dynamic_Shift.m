function [lambda,xx,iter,lambdas] = inverse_powershiftmethdynamic(A,alpha,tol,itMax,x0)   
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

    
    m = yy'*xx;
    
    %% Power Method
    while iter<itMax && err>=tol
        B = A-eye(n)*m;
        % calculate new eigenvector
        xx = B\yy;
        yy = xx/norm(xx,2);
        
        old_m = m;
        
        
        
        % compute new eigenvalue
        m = (yy'*xx);
        
        % New iteration 
        iter = iter + 1;
        
        xxs(:,iter) = yy; % normalized output for eigenvector estimation
        
        lambda = 1/m + alpha;
        
        lambdas(iter) = lambda;
        
        if iter > 1
           err = abs(m - old_m); 
        end

    end
    lambdas = lambdas(1:iter); % keep only interesting lambdas
    xxs = xxs(:,1:iter);
    xx = yy; % Final normalized xx
end