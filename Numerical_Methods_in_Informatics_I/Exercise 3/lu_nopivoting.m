function [L, U] = lu_nopivoting(A)
    [n,m] = size(A);
    if n~=m
        errmsg = ('The matrix is not square');
        disp(errmsg);
    else
        for k=1:n-1
            for i=(k+1):n
                A(i,k)=A(i,k)/A(k,k);
                if A(k,k)==0
                    errmsg = ('Diagonal element = 0!');
                    disp(errmsg);
                else
                    j=(k+1:n);
                    A(i,j)=A(i,j)-A(i,k)*A(k,j);
                end
            end
        end
    end
    U=triu(A);
    L=tril(A);
    for i=1:n
        L(i,i) = 1;
    end
end

