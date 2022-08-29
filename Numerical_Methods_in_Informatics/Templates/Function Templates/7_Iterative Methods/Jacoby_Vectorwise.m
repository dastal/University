function [xxs,it] = Jacoby_Vectorwise(A,b,x0,tol,Nmax)
    %% Parameters
    % initializing it
    it = 0;
    
    % intializing xxs
    xxs = zeros(length(x0),Nmax);
    
    % entering the intial x0 into xxs
    xxs(:,1) = x0;
    
    % Take size of A to compute D and E
    [m,n] = size(A);
    
    % Computing D
    D = zeros(m,n);
    for i=1:m
       for j=1:n
          if i==j
             D(i,j) = A(i,j); 
          end
       end
    end
    
    %% Jacoby
    for k=2:Nmax
        % Computing rk
        rk = b-A*xxs(:,k-1);

        % Jacoby Formula
        xxs(:,k) = xxs(:,k-1)+D^-1*rk;

        % incrementing iterator
        it = it+1;

        % stopping criterion
        if norm(xxs(:,k)-xxs(:,k-1))<=tol
            solMsg = ("The algorithm stopped after " + num2str(it) + " interations.");
            disp(solMsg);
            break;
        end
    end
    
    %% return the shortenend result
    xxs = xxs(:,1:it+1);
end

