function [x,it] = Newton_Method_Optimization(x0,tol)
    %% Parameters
    % Compute gradient
    grad_f = @(x) 1/5*x*(2*sin(x)+x*cos(x));
    
    % Compute the Hessian Matrix
    Hf = @(x) 1/5*((x^2-2)*sin(x)-4*x*cos(x));
    
    % Handing over x
    x = x0;
    
    % Initialize the error
    err = tol+1;
    
    %% Applying the Algorithm
    while err>tol
        it = it+1;
        p = -grad_f(x)/Hf(x);
        x_new = x+p;
        err = abs(x_new-x);
        x = x_new;
    end
    
    %% Checking the Conditions
    condition1 = grad_f(x);
    condition2 = x'*Hf(x)*x;
    
    if condition1 == 0 && condition2 > 0
       fprintf("The conditions for a local minimum are fullfilled.\n");
    else
        fprintf("The conditions for a local minimum are not fullfilled.\n");
    end
    
    %% Convergence Message
    if err<tol
        fprintf("The Newton Method for Optimization converged in %d steps with the error=%.4f and the exact result x=%.4f \n", it,err,x);
    else
        fprintf("The Newton Method for Optimization did not converge.\n");
    end
end
