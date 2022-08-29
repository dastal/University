function [x, it, xx] = newtonsMethod(fun, ffun, x0, eps, itMax)
    it = 0;
    x = fun(x0);
    xx = (itMax);
    
    if it<0
        errorMsg1 = ("Invalid number of iterations");
        error(errorMsg1);
    end
    
    if ffun(x0)==0
        errorMsg2 = ("The Newton's Mehtod is not applicable because f'(x0)=0.");
        error(errorMsg2);
    end
    
    for i = 1:itMax
        it = it + 1;
        x = x0 - fun(x0) / ffun(x0);
        if ((abs(x-x0))<=eps)
            break;
        end
        xx(it) = x;
        x0 = x;
    end
    
    answer = ['The zero value is ' num2str(x0) ' with ' num2str(it) ' iterations.'];
    disp(answer);
end

