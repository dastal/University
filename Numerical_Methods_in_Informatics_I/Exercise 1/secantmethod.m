function[x,it] = secantmethod(fun,x0,x1,eps)
    it = 0;
    maxIterations = 10^6;
    while (abs(x0-x1) > eps)
        it = it + 1;
        if it > maxIterations
            errorMsg = ['The maximum of ' num2str(maxIterations) ' iterations is reached!'];
            error(errorMsg);
        end
        temp = x1;
        x1 = temp - fun(temp) * (temp-x0)/(fun(temp) - fun(x0));
        x0 = temp;
    end
    answer = ['The convergence criterion is reached and the number of iterations is: ' num2str(it) '.'];
    disp(answer);
    x=x1;
end