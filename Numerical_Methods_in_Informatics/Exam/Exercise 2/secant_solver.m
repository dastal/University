function [x, it] = secant_solver(fun, guesses, tol)
    % Parameters
    it = 0;
    maxIter = 100;
    
    x0 = guesses(1);
    x1 = guesses(2);
    
    % Secant Method
    for k=2:maxIter
        % absolute increment
        if abs(x1-x0)<tol
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

