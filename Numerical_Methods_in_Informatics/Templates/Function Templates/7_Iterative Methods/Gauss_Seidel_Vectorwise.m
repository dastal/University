function [xxs,it] = Gauss_Seidel_Vectorwise(A,b,x0,tol,Nmax,stopCr)
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
    
    % Computing E
    E = zeros(m,n);
    for i=1:m
       for j=1:n
          if i>j
             E(i,j) = -A(i,j); 
          end
       end
    end
        
    %% Gauss-Seidel
    % checking stopping criterion
    if stopCr == 0
        for k=2:Nmax
            % Computing rk
            rk = b-A*xxs(:,k-1);

            % Gauss-Seidel Formula
            xxs(:,k) = xxs(:,k-1)+((D-E)^-1)*rk;
            
            % incrementing iterator
            it = it+1;

            % stopping criterion
            if norm(xxs(:,k)-xxs(:,k-1))<=tol
                solMsg = ("The algorithm stopped after " + num2str(it) + " interations.");
                disp(solMsg);
                break;
            end
        end
    elseif stopCr == 1                
        % Enter the for-loop
        for k=1:Nmax-1
            
            % compute the next rk
            rk = b-A*xxs(:,k);
            
            % Gauss-Seidel Formula
            xxs(:,k+1) = xxs(:,k)+((D-E)^-1)*rk;
            
            % incrementing iterator
            it = it+1;
            
            % stopping criterion
            if norm(rk)<=(tol*norm(b))
                solMsg = ("The algorithm stopped after " + num2str(it) + " interations.");
                disp(solMsg);
                break;
            end
        end
    else
        errMsg = "The stopping criterion has to be 0 or 1";
        disp(errMsg);
    end
    
    %% return the shortenend result
    xxs = xxs(:,1:it+1);
end
