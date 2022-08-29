function [xxs,it] = gaussSeidel(A,b,x0,tol,Nmax,stopCr)
    % Initialization of the iteration matrix and storage of the iterates
    L = tril(A);
    xxs = zeros(length(x0),Nmax);
    
    % Intialize the iteration qauntities
    it = 0;
    x = x0;
    r = b-A*x;
    
    % Select the stopping criterion and testing if we should even start the
    % iteration
    if (stopCr == 0)
        err = tol+1;
        x0n = norm(x0,1);
    elseif (stopCr == 1)
        b0 = norm(b,1);
        err = norm(r)/b0;
    else
        error("Stopping criterion not valid, can only be 0 or 1!");
    end
    
    % Looping until we achieved the desired convergence tolerance or maxed
    % out the iteration steps
    while ((err) > tol) && (it < Nmax)
        
        % Increments
        it = it+1;
        
        % Gradient step
        dx = L\r;
        x = x+dx;
        r = b-A*x;
        
        % Evaluating the convergence criterion
        if(stopCr == 0)
            err = norm(dx,1)/x0n;
        else
            err = norm(r,1)/b0;
        end
        
        % Append the result to the history
        xxs(:,it) = x;
    end
    
    if err>tol
        fprintf("Gradient method not converged. \n");
    end
    
    % shortening the result
    xxs = xxs(:,1:it);
end

