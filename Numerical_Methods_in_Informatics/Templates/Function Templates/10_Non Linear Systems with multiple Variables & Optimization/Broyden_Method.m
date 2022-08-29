function [x,res,niter] = Broyden_Method(Ffun, Bfun, x0, tol, nmax)
    %% Parameters
    % Initialize interaion parameter
    niter = 0;
    
    % Initialze error
    err = tol + 1;
    
    % Hand over x0 to x
    x = x0;
    
    % Compute B
    B = Bfun(x);
    
    %% Broyden Method
    while err>=tol && niter<nmax
        F = Ffun(x);
        niter = niter+1;
        p = -B\F;
        x_new = x+p;
        df = Ffun(x_new)-Ffun(x);
        B = B+((df-B*p)*p')/(p'*p);
        err = norm(p);
    end
    res = norm(Ffun(x));
    
    %% Answering messages 
    if (niter==nmax) && (err>tol)
        fprintf("The Broyden's method did not converge in %d steps. \n", nmax);
    else
        fprintf("The Broyden's method converged in %d steps with the error %f. \n", niter, err);
    end
end

