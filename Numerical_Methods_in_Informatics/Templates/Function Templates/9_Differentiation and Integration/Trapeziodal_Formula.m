function [It] = Trapeziodal_Formula(f,a,b)
    % Trapezoidal Formula
    It = (b-a)*((f(a)+f(b))/2);
end

