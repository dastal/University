function [coeff] = Cubic_Spline_Complete_Spline(nodes, yys, fder)
    % Parameters
    n = length(nodes)-1;
    coeff = zeros(n,4);
    h = zeros(n,1);
    rhs = zeros(n+1,1);
    A = zeros(n+1,n+1);
    
    % compute vector h
    for i=1:n
        h(i) = nodes(i+1)-nodes(i);
    end

    % compute a coeffitients
    for k =1:n
       coeff(k,4) = yys(k);
    end

    % compute rhs
    for i = 2:n
        rhs(i) = (3/h(i)).*(yys(i+1)-yys(i))-(3/h(i-1)).*(yys(i)-yys(i-1));
    end
    rhs(1) = (yys(n)-yys(n-1))/h(1)-fder(nodes(1));
    rhs(n) = -((yys(n)-yys(n-1))/h(n-1))+fder(nodes(end));
    
    % compute matrix A
    for i=2:n
       for j=1:n+1
           if i==j
               A(i,j)= 2*(h(i-1)+h(i));
           elseif i==j+1
               A(i,j) = h(i-1);
           elseif i==j-1
               A(i,j) = h(i);
           end
       end
    end
    A(1,1) = 1;
    A(1,2) = (h(2)+2*h(1))/(h(2)-h(1));
    A(length(A),length(A)) = (h(n-1)+h(n))/3;
    A(length(A),length(A)-1) = h(n-1)/6;
    
    % compute c coeffitients
    c = A\rhs;
    
    % compute the coeffitient Matrix
    for i=1:n
        coeff(i,1) = (c(i+1)-c(i))/(3*h(i));
        coeff(i,2) = c(i);
        coeff(i,3) = (1/h(i))*(yys(i+1)-yys(i))-(h(i)/3)*(2*c(i)+c(i+1));
    end
end
