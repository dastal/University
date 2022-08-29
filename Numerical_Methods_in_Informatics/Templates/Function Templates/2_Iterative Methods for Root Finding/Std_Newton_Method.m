function [x, it, xx] = Std_Newton_Method(f, fder, x0)
    %% Parameters
    % Maximum iterations
    itmax = 500;
    
    % Tolerance
    tol = 1e-6;
    
    % vector of all compouted xs
    xx = [];
    
    % initialize it
    it = 0;
    
    % initialize err -> relative increment
    err = tol+1;
    
    % Hand over x
    x = x0;
    
    % for the relative increment
    x0n = abs(x0);
    
    %% Newton method
    while it<itmax && err>tol
        it = it+1;
        dx = -f(x)/fder(x);
        x = x+dx;
        err = abs(dx)/x0n;
        xx = [xx x];
    end
    
    %% Answering messages
    if (err<tol)
        fprintf("The standard Newton mehtod converged with %d iteration(s) and error=%.2e \n", it, err);
    else
        fprintf("The standard Newton method did not converge in %d iterations with the error: %.2e", itmax, err);
    end
end
