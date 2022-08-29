function [Ic] = comp_simpson(fun, xa, xb, M)    
    %% Parameters
    % Creating the subintervals
    x = linspace(xa,xb,M+1);
    h = x(2)-x(1);
    
    % Initialising the integration value
    Ic = 0;
    
    %% Composite Simpson Rule
    for k = 1:M
        ak = fun(x(k));
        bk = fun(x(k+1));
        ck = fun(0.5*(x(k)+x(k+1)));
        
        Ic = Ic+(h/6)*(ak+bk+4*ck);
    end
    
end