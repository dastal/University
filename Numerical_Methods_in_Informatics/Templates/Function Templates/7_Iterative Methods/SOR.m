function [x,xhist,iter]= SOR(A,b,x0,nmax,tol,omega)
    % Function implementing the SOR iterative method
    %
    % Inputs:
    %      A:    matrix of the problem Ax=b
    %      b:    second member of the problem Ax=b
    %      x0:   initial guess
    %      nmax: numer max of iterations
    %      tol:  tolerance
    %      omega: relaxation parameter
    %
    % Output:
    %     x:    solution
    %     iter: number of required iterations
    
    
    % Constructing the matrices involvolved in the iterations
    D = diag(diag(A));
    E = -tril(A,-1);
    P = (D - omega*E)/omega;
    invP = inv(P);

    % Initialising the quantities for the iteration and the error estimation
    iter= 0;
    b_n = norm(b); 
    err = b_n;
        
    x = x0;
    xhist = [x0];
    r = b-A*x0;
    
    % Processing the iteration method
    while err > tol && iter < nmax
        % Iteration
        dx = invP*r;
        x = x + dx;
        r = b - A * x;
        
        % Stopping criterion
        iter = iter + 1;
        err = norm (dx) / b_n;
        
        % History
        xhist = [xhist, x];
    end
end
