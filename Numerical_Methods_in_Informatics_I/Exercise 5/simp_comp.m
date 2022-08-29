function [I] = simp_comp(f,n)
    x = linspace(0,1,n+1);
    xBar = zeros(n,1);
    %in this case a=0 and b=1, therefore: h = (1-0)/n
    h = 1/n/6;
    I = 0;
    
    %compute xBar
    for k=2:(n+1)
        xBar(k-1) = (x(k-1)+x(k))/2;
    end
    
    %compute the complement Simpson's rule
    for k=2:(n+1)
        I = I + (f(x(k-1))+4*f(xBar(k-1))+f(x(k)));
    end
    I = h*I;
end

