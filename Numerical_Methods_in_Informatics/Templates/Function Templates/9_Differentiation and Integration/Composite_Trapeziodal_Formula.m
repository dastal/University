function [Ic] = Composite_Trapeziodal_Formula(fun,xa,xb,M)
    %% Parameters
    % Creating the subintervals
    x = linspace(xa,xb,M+1);
    h = (xb-xa)/M;
    
    % Initialising the integration value
    Ic = 0;
    
    %% Composite Trapezoidal Rule
    for k = 1:M
        ak = fun(x(k));
        bk = fun(x(k+1));
        
        Ic = Ic+(h/2)*(ak+bk);
    end
end
