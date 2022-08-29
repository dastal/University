function [x,res,it] = Newton_Method_Optimization(Ffun,Hfun,x0,tol,nmax)
    %% Parameters
    % Iteration Parameter
    it = 0;
    
    % Handing over x
    x = x0;
    
    % Initialize the error
    err = tol+1;
    
    %% IMPORTANT: maybe x(1),x(2), etc. must be adjusted
    
    %% Applying the Algorithm
    while err>tol && it<nmax
        it = it+1;
        Hf = Hfun(x(1),x(2));       % Hessian
        grad_f = Ffun(x(1),x(2));   % Gradient
        p = -Hf\grad_f;
        x_new = x+p;
        err = norm(p);
        x = x_new;
    end
    res = norm(Ffun(x(1),x(2)));
    
    %% Convergence Message
    if err<tol
        fprintf("The Newton Method for Optimization converged in %d steps with the error=%.4f and the exact result x=%.4f \n", it,err,x);
    else
        fprintf("The Newton Method for Optimization did not converge.\n");
    end
end
