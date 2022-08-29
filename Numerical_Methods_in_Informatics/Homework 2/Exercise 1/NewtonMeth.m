function [x, r, it, xxs] = NewtonMeth(fun, dfun, x0, itMax, eps)
    % Parameters
    it = 0;
    xxs = zeros(itMax,0);
    x = fun(x0);
    
    % Newton's Method
    for i = 1:itMax
        it = it + 1;
        x = x0 - fun(x0) / dfun(x0);
        xxs(it) = x;
        if ((abs(x-x0))<=eps)
            break;
        end
        x0 = x;
    end
    
    % computing the residual
    r = x0-x;

end