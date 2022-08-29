function out=curry(f,g,x)
    % NOTE: this function should be names curry.m, please change it before running.
    % Run example: curry(@(x) x^2, @(x) sqrt(x), 125)

    % Writing the composition of the two given functions evaluated at the point x.
    out=f(g(x));
    
end 
