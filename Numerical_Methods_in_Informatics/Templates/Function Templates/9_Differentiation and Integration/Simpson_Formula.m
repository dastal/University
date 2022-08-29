function [Is] = Simpson_Formula(f,a,b)
    % Computing x_bar
    x_bar = (a+b)/2;
    
    % Simpson Formula
    Is = (b-a)*(f(a)+4*f(x_bar)+f(b))/6;
end

