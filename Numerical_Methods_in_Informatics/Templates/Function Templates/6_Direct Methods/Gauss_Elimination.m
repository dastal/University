function x = Gauss_Elimination(A,b)

% Error message if necessary
[n,m]=size(A);
b=b(:); %Column vector
n2=length(b);
if n ~= m || n ~= n2
    disp("Error in matrix size")
    x=nan*b;
    return;
end

%% Triangularisation
for j=1:(n-1)
    for i=(j+1):n
        b(i)=b(i)-b(j).*A(i,j)./A(j,j);
        A(i,:)=A(i,:)-A(j,:).*A(i,j)./A(j,j);
    end
end

disp("Upper triangular matrix:")
disp(A)


%% Backward solving

for j=n:-1:1
    b(j)=b(j)./A(j,j);
    for i=1:(j-1)
        b(i)=b(i)-b(j)*A(i,j);
    end
end

x=b;
    