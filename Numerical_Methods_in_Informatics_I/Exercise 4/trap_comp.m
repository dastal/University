function [I] = trap_comp(f,n)
    x = linspace(0,1,n+1);
    sum = 0;
    %H = (b-a)/n
    H = 1/n;
    
    %Trapezoidal Formula
    for k = 2:n
        sum = sum + f(x(k));
    end
    I = H/2 * (f(x(1))+2*sum+f(x(n+1)));
end

