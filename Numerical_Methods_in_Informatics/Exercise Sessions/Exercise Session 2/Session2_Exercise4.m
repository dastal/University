function p = bisection( f,a,b )
    % Computes the bissection algorithm on a given function handle f
    % NOTE: the name of the file should be bisection.m, please change it accordinggly.
    % Run with bisection(@(x) sin(x), 3, 3.5)

    if f(a)*f(b)>0  %the fct values has to have different values
        disp('Wrong choice')
    else
        % compute the midpoint of the interval
        p = (a + b)/2; 
        err = abs(f(p));
        
        % until the convergence is satisfactory
        while err > 1e-7 
            
            % Select the next point to consider
            if f(a)*f(p)<0 
                b = p;
            else
                a = p;          
            end
            
            % Computing the achieved error at this step
            p = (a + b)/2;
            err = abs(f(p));
        end
    end
end
 
