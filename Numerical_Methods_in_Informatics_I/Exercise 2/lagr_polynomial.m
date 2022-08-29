%Find the script to this function on lagr_error.m
function [res, err] = lagr_polynomial(x)
    res = zeros(4,1);
    sum = 0;
    f = @(x) cos(x);
    xValues = [0 0.6 0.9];
    k = length(xValues);
    y = (k);
    for i=1:k
        y(i) = f(xValues(i));
    end
    
    %Lagrange
    for i=1:k
        prod = 1;
        for j=1:k
            if i~=j
                term = (x-xValues(j))/(xValues(i)-xValues(j));
                prod = prod * term;
            end
        end
        res(i) = prod;
        sum = sum + prod * y(i);
    end
    res(4) = sum;
    err = cos(x)-sum;
    
    resmsg = ['Result: ' num2str(sum, '%.4f')];
    disp(resmsg);
    errmsg = ['Error: ' num2str(err, '%.4f')];
    disp(errmsg);
end