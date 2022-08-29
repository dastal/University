function [x, it] = Secant_Method(fun, x0, x1, eps)
    % Parameters
    it = 0;
    maxIter = 10000;
    
    % Secant Method
    for k=2:maxIter
        % absolute increment
        if abs(x1-x0)<eps
            successMsg = ("The secant method terminated successfully after " + num2str(it) + " iterations.");
            disp(successMsg);
            break;
        else
            temp = x1;
            x1 = x1-fun(x1)*((x1-x0)/(fun(x1)-fun(x0)));
            x0 = temp;
            it = it+1;
        end
    end
    if it == maxIter
        errMsg = ("The maximum of " + num2str(maxIter) + " iterations was reached without a fitting convergence...");
        disp(errMsg);
    end
    x = x1;
end

