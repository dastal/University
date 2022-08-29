function [xx,it,err_hist] = delta_iteration(A,b,x0,delta)
    %% Parameters
    % Maximum iterations
    itMax = 100;
    
    % Tolerance
    tol = 10^-8;
    
    % Iterator 
    it = 0;
    
    % Initializing the error
    err = tol+1;
    
    % Intializing error list
    err_hist = zeros(itMax,1);
    
    % Handing over x0 to xx
    xx = x0;
    
    % Preparing Iteration Mehtod
    rk = b-A*xx;
    Pdelta = [1; 1; 1]*delta;
    
    %% Iteraion Method
    while it<itMax && err>tol
        % Increasing the iterator
        it = it+1;
        
        % Iteration
        z = rk./Pdelta;
        xx = xx + z;
        rk = b - A * xx;
        
        % Computing the error
        err = norm(rk,2);
        
        % Adding the error to the error history
        err_hist(it) = err; 
    end
    
    if err>tol
       disp("The iteration Method with delta=" + num2str(delta) + " did not converge with err=" + num2str(err));
    else
       disp("The iteration Method with delta=" + num2str(delta) + " converged in " + num2str(it) + " iterations with x=");
       disp(xx);
    end
end

