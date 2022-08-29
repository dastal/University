function pi_lim=pisim(n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function computes pi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pi is given by the approximation to the limit pi_n = 4m/n.
%
% Input: 
%   n 
%
% Output:
%   pi_lim
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% we generate the couple of x and y vectors randomly
x=rand(n,1); 
y=rand(n,1);

z=x.^2+y.^2; % equation of the circle

% check if w(k)<=1 for any component of z:
v=(z<=1); % v(k) is set to 1 or otherwise 0

m=sum(v); % we sum all the components of v 
          % (the number of points falling in the interior of the unit
          % circle)


pi_lim=4*m/n;