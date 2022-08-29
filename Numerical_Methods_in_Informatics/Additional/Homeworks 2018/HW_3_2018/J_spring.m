function [J]=J_spring(x)

K=100;
b=-10;
L=20;

n=length(x);
x=[0; x; L];
J=zeros(n,n);

for j=1:n
    i=j+1;
    J(j,j)=-2*K+3*b*((x(i)-x(i-1))^2+(x(i+1)-x(i))^2);
    if(j>1)
        J(j,j-1)=K-3*b*(x(i)-x(i-1))^2;
    end
    
    if (j<n)
        J(j,j+1)=K-3*b*(x(i+1)-x(i))^2;
    end
end