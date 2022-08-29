function d = LaplaceRule(A)

    [~,n]=size(A);
    
    if n==1
       d = A;
    else
       d = 0;
       for k=1:n
          B = A(2:n, [1:k-1, k+1:n]);
          d = d +(-1).^(k+1).*A(1,k)*LaplaceRule(B);
           
       end
        
    end   


end