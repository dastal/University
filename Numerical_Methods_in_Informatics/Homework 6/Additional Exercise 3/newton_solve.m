function [x] = newton_solve(fun,dfun,x0,eps,itMax)
    % INPUT:    fun: function handle
    %           dfun: derivative function handle
    %           x0: initial value
    %           itMax: number of maximum iterations
    %           eps: prescribed convergence tolerance
    % OUTPUT:   x: approximated result
    
    % First error with residual
    err = abs(fun(x0));
    
    % Initialise array for intermediate x values
    xxs = [x0];
    
    % Initialise counter
    it = 0;
    
    while (err>eps && it<itMax)
        x1 = x0-fun(x0)/dfun(x0);
        err = abs(x1-x0);
        x0=x1;
        it = it+1;
        xxs = [xxs, x1];
    end
    
    % Messages for success or no success of the Newton Method
    if (err<eps)
        fprintf("Convergence obtained with %d iteration(s) and error %e. \n", it, err);
    else
        fprintf("Not converged with %d iteration(s) and error %e \n", it, err);
    end
    
    % Handing over x
    x = x1;
end