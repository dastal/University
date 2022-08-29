function [x, it] = Bisection(fun, x0, x1, eps)
    % Parameters
    itMax = 10000;
    it = 0;
    err = eps+1;
    
    % Interval Bounds
    a = x0;
    b = x1;
    
    % Bisection Method
    while ((err>eps)&&(it<itMax))
        % Midpoint
        mid = (a+b)*0.5;
        
        % Select part of the interval
        if fun(a)*fun(mid)<0
            b = mid;
        else
            a = mid;
        end
        
        % computing error (= stopping criterion) and icrement "it"
        err = 0.5*abs(b-a);
        it = it+1;
    end
    
    % Informing the user of the function output
    if ((err>eps) || (it>itMax))
        % Case where the function failed to find the zero before the
        % allowed number of iterations
        error(sprintf("After %d iterations, no root has been found with the desired accuracy.", it))
    else
        
        % Informing the user
        fprintf("The number of iterations required to achieve the tolerance %f is %d\n", eps, it);
        
        % Estimate the zero as the mid point of the found interval
        x = (a+b)*0.5;
        fprintf("The root is located within the interval [%d, %d]\n", a, b);
    end
end

