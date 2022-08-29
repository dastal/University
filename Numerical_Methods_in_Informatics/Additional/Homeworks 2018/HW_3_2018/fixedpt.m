function [suc,it] = fixedpt(x0,phi,nmax,tol,a,b)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fixed point method
%%%%%%%%%%%%%%%%%%%%%
%
% [suc,it] = fixedpt(x0,phi,nmax,tol,[a b]);
%
% Input:
%   x0   =  Initial guess
%   phi  =  function of the fixed point
%   nmax = maximum number of iterations
%   tol  =  tolerance for the criterion to stop
%   a,b  =  extrema of the considered interval 
%
% Output:
%   suc = vector containing all the iteratives (the last column
%           contains the solution)
%   it    = performed iterations
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = linspace(a,b,1000);
xspace = linspace(a,b,1000);
plot(x,x,'g',x,phi(x),'b')
hold on

suc = x0;
x = x0;
x = phi(x);
suc = [suc; x];
plot([x0 x0],[0 x],'r')
plot([x0 x],[x x],'r')
err =1; 
it =1;
while (err >= tol && it < nmax)
    xold = x;
    x= phi(x);
    
    suc = [suc; x];
    
    plot([xold xold],[xold x], 'r')
    plot([xold x],[x x], 'r')

    err = abs(x-xold);
    it = it + 1;
end
    hold on
    plot(xspace,zeros(size(xspace)),'k')
    title('Representation of the iteratives for the fixed point method')
    xlabel('x')
    ylabel('y')
    legend('Bisector of the axis','phi(x)', 'Iterations','Location', 'SouthEast')
hold off
axis([a,b,a,b]) 

if it < nmax %ovvero ho convergenza
    fprintf('\n Number of iterations : %d \n', it);
    fprintf('Computed iterations: %12.8f \n\n',suc(it+1));
else
    fprintf('\n Maximum number of iterations reached!! \n\n');
end
