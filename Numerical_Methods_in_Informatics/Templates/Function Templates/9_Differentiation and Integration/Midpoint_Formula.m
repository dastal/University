function [Imp] = Midpoint_Formula(f,a,b)
    % Computing x_bar
    x_bar = (a+b)/2;
    
    % Midpoint Formula
    Imp = (b-a)*f(x_bar);
end

