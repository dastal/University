function [y] = F_spring(x)
K=100;
b=-10;
L=20;
n=length(x);

x=[0; x; L];
y=zeros(n,1);

for j=1:n
    i=j+1;
    y(j)=-K*(-x(i-1)+2*x(i)-x(i+1))+...
        b*((x(i)-x(i-1))^3-(x(i+1)-x(i))^3);
end


end
