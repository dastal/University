function [x, it, xx] = newtonsMethod(fun, ffun, x0, eps, itMax)
    % Parameters
    xx=zeros(itMax,1);
    xx(1) = x0;
    xx(2) = x0-fun(x0)/ffun(x0);
    it = 1;
    
    % Newtons Method
    for k=3:itMax
        if abs(xx(k-1)-xx(k-2))<=eps
            successMsg = ("The Newtons Method terminated successfully after " + num2str(it) + " iterations.");
            disp(successMsg);
            break;
        else
            xx(k) = xx(k-1)-fun(xx(k-1))/ffun(xx(k-1));
            it = it+1;
        end
    end
    if it >= itMax-1
        errMsg = ("The maximum of " + num2str(itMax) + " iterations was reached without a fitting convergence...");
        disp(errMsg);
        x = NaN;
        return;
    else
        x = xx(it);
    end
end

