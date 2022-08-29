function [res] = Piecewise_Linear_Interpolation(fun,x, xi, xi1)
    % Interpolates the in the wanted interval
    % Several intervals -> for-loop over all intervals and save result in
    % an array
    res = fun(xi) + ((fun(xi1) - fun(xi))/(xi1 - xi)) * (x - xi);
end

