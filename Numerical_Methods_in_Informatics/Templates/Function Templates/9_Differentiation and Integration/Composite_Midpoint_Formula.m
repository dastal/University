function [Ic] = Composite_Midpoint_Formula(fun,xa,xb,M)
    %% Parameters
    x = linspace(xa,xb,M+1);
    h = (xb-xa)/M;
    
    % Initialising the integration value
    Ic = 0;
    
    %% Composite Midpoint Rule
    for k=2:M+1
       xk_bar = x(k-1)+x(k);
       
       Ic = Ic+h*f(xk_bar);
    end
end
