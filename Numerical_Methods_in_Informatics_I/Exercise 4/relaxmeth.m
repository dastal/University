function [x,iter] = relaxmeth(A,b,x0,nmax,tol,omega)
    [n,m] = size(A);
    x = zeros(n,nmax+1);
    rel_incr = norm(x0)/norm(b);
    iter = 1;
    xCurr = zeros(n,1);
    xPrev = x0;
    
    if omega<0 || omega>2
        errmsg = ('Wrong relaxation parameter. Must be between 0 and 2!');
        disp(errmsg);
        return
    end
    
    if n~=m
        errmsg = ('A is not square');
        disp(errmsg);
        return
    end
    
    while rel_incr>tol && iter<nmax
        for i = 1:n
            sum1 = 0;
            sum2 = 0;
            for j = 1:(i-1)
                sum1 = sum1 + A(i,j)*xCurr(j);
            end
            for j = (i+1):n
                sum2 = sum2 + A(i,j)*xPrev(j);
            end
            xCurr(i) = (1-omega)*xPrev(i) + (omega/A(i,i)) * (b(i)-sum1-sum2);
        end
        iter = iter+1;
        x(:,iter) = xCurr;
        rel_incr = norm(xCurr-xPrev)/norm(b);
        xPrev = xCurr;
        xCurr = zeros(n,1);
    end
    x = x(1:n,1:iter);
end

