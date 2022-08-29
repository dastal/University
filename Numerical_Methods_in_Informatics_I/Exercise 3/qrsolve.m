function [Q, R] = qrsolve(A)
    [m,n] = size(A);
    Q = zeros(m);
    R = zeros(m);
    
    if m ~= n
        errmsg = "The matrix is not square!";
        disp(errmsg);
    else
        for i = 1:n
            if i == 1
                Q(:,1) = A(:,1)/norm(A(:,1));
                R(1:1) = norm(A(:,1));
            elseif i == 2
                q = Q(:,1)/norm(Q(:,1));
                v = A(:,2)-q*dot(q,A(:,2));
                Q(:,2) = v/norm(v);
                R(1,2) = dot(q,A(:,2));
                R(2,2) = norm(v);
            else
                v = A(:,i);
                for j = 1:i
                    q = Q(:,j);
                    temp = dot(q,A(:,i));
                    v = v - q * temp;
                    R(j,i) = temp;
                end
                R(i,i) = norm(v);
                Q(:,i) = v/norm(v);
            end
        end
    end
end