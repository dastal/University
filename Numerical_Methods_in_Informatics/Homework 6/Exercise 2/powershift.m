function [lambda,xx,iter,lambdas,xxs] = powershift(A,alpha,tol,itMax,x0)   
    %% Check the correct format of the inputs
    if ~isnumeric(A) || size(A,1)~=size(A,2)
        error('The input argument A must be a square matrix of numeric type!');
    elseif size(x0,1)~=size(A,1) || size(x0,2)~=1
        error('The input argument V does not match the input argument A!');
    elseif tol<=0
        error('The input argument TOL must be positive!');
    elseif itMax<=0 || rem(itMax,1)~=0
        error('The input argument ITMAX must be a positive integer!');        
    end
    
    %% Parameters
    % Size of A
    n = size(A,1);
    
    % Computing B (shifted matrix)
    B = A-eye(n)*alpha;
    
    % Intializeing the error
    err = 1e10;
    
    % Initializing iter
    iter = 0;
    
    % Initial guess
    xx = x0;
    
    % Initial y
    yy = xx/norm(xx,2);
    
    % Initializing the history of erstimation of eigenvalues
    lambdas = zeros(1,itMax);
    
    % Initializing the history of estimation of eigenvectors
    xxs = zeros(n,itMax);
    
    %% Power Method with shift
    while err>=tol && iter<itMax
        % Compute the new eigenvector
        xx = B*yy;
        yy = xx/norm(B*yy,2);
        
        % Compute the new eigenvalue
        lambda = yy'*(B*yy);
        
        % New iter and storage of the history
        iter = iter+1;
        
        % Normalized output for eigenvector estimation
        xxs(:,iter) = yy;
        
        % Do not forget the shift!
        lambdas(iter) = lambda+alpha;
        
        % Compute the error for stopping criterion
        if iter>1
            err = abs(lambdas(iter)-lambdas(iter-1)) / ...
                abs(lambdas(iter)-alpha);
        end
    end
    
    %% Preparing the parameters to be returned
    % Final output without forgetting the shift
    lambda = lambda+alpha;
    
    % Shortening lambdas to keep only the relevant values
    lambdas = lambdas(1:iter);
    
    % Shortening xxs to keep only the relevant values
    xxs = xxs(:,1:iter);
    
    % Handing over the final normalized xx
    xx = yy;
end