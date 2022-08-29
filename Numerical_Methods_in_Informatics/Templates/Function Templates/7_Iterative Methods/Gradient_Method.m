function [x,it,hist] = Gradient_Method(A,b,x0,tol,itMax,flag)
    %% Checking dimensions
    n = length(x0);
    if (length(b)~=n) || sum(size(A)~=[n,n])
        error("ERROR: Dimensions mismatch");
    end
    
    %% Parameters
    hist = zeros(1,itMax);
    x = x0;
    r = b-A*x;
    n_r0 = norm(r);
    it = 0;
    err = tol+1;
    alpha = 1;
    
    %% Gradient Method
    while (it<itMax && err>tol )
       % increment the iteration
       it = it+1;
       
       % Method
       s=A*r;
       
       % flag handling
       if (flag)
           % recompute alpha only at even iteration
           if (rem(it,2)==0)
              alpha = (r'*r)/(r'*s);    %Step length 1d)
           end           
       else
           alpha = (r'*r)/(r'*s);       %Step length 1a)
       end
       
       x = x+alpha*r;
       r = r-alpha*s;
       err = norm(r)/n_r0;
       hist(:,it) = err;
    end
    
    % Non-convergence case
    if err>tol
        fprintf("Gradient method did not converge.");
    end
end
