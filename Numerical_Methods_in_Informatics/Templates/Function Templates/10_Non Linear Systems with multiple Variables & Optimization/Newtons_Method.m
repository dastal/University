function [x, res, niter] = Newtons_Method(Ffun, Jfun, x0, tol, nmax)
    %NEWTONSYS Finds a zero of a nonlinear system...
    %% Parameters
    % Initialize interaion parameter
    niter = 0;
    
    % Initialze error
    err = tol + 1;
    
    % Hand over x0 to x
    x = x0;
    
    %% Newton's method
    while err >= tol && niter < nmax
        J = Jfun(x);
        F = Ffun(x);
        delta = -J\F;
        x = x + delta;
        err = norm(delta);
        niter = niter + 1;
    end
    res = norm(Ffun(x));
    
    %% Answering messages 
    if (niter==nmax) && (err>tol)
        fprintf("The Newton's method did not converge in %d steps. \n", nmax);
    else
        fprintf("The Newton's method converged in %d steps with the error %f. \n", niter, err);
    end
end

