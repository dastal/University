function y=lagrange(x,x_given,y_given)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Lagrange polynomial interpolation function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% y=lagrange(x,x_given,y_given)
%
% Input:
%   x = value for which the interpolation is computed
%   x_given = vector with the known values of x
%   y_given = vector with the known values of y
%
%
% Output:
%   y = correspondant value to x extrapolated via Lagrangian polynomial
%       interpolation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n=size(x_given,2);
L=ones(n,size(x,2));

   for i=1:n
      for j=1:n
         if (i~=j)
            L(i,:)=L(i,:).*(x-x_given(j))/(x_given(i)-x_given(j));
         end
      end
   end
   y=0;
   for i=1:n
      y=y+y_given(i)*L(i,:);
   end