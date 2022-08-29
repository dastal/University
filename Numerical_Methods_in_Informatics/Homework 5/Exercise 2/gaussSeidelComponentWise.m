function [xxs,it] = gaussSeidelComponentWise(A,b,x0,tol,Nmax,stopCr)
    %% Parameters
    % initializing it
    it = 0;
    
    % intializing xxs
    xxs = zeros(length(x0),Nmax);
    
    % entering the intial x0 into xxs
    xxs(:,1) = x0;
    
    
    n = size(x0);
        
    %% Gauss-Seidel component-wise
    % checking stopping criterion
    if stopCr == 0
        % Enter the for-loop
        for k=2:Nmax
            
            for i=1:n
                % initializing the sums
                sum1 = 0;
                sum2 = 0;

                % first sum of the component-wise formula
                for j=1:(i-1)
                    sum1 = sum1+A(i,j)*xxs(j,k);
                end

                % second sum of the component-wise formula
                for j=(i+1):n
                    sum2 = sum2+A(i,j)*xxs(j,k-1);
                end

                % computing the new component
                xxs(i,k) = (1/A(i,i))*(b(i)-sum1-sum2);
            end
            
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
            
            % stopping criterion
            if norm(rk)<=(tol*norm(b))
                solMsg = ("The algorithm stopped after " + num2str(it) + " interations.");
                disp(solMsg);
                break;
            else
                for i=1:n
                    % initializing the sums
                    sum1 = 0;
                    sum2 = 0;
        
                    % first sum of the component-wise formula
                    for j=1:(i-1)
                        sum1 = sum1+A(i,j)*xxs(j,k+1);
                    end
        
                    % second sum of the component-wise formula
                    for j=(i+1):n
                        sum2 = sum2+A(i,j)*xxs(j,k);
                    end
        
                    % computing the new component
                    xxs(i,k+1) = (1/A(i,i))*(b(i)-sum1-sum2);
                end
            end
            

            
            % incrementing iterator
            it = it+1;
        end
    else
        errMsg = "The stopping criterion has to be 0 or 1";
        disp(errMsg);
    end
    
    %% return the shortenend result
    
    xxs = xxs(:,1:it+1);
end
