function [xvect,it]=bisect(a,b,tol,fun)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bisection Method to solve the nonlinear equation f(x)=0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [xvect, it]=bisect(a,b,tol,fun) 
%
% Input:
%   a,b = extrema of the considered interval 
%   tol = tolerance for the criterion to stop
%   f   =  function 
%
% Output:
%
%   xvect = vector containing all the iteratives (the last column
%           contains the solution)
%   it    = performed iterations
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

it= -1;
xvect=[];

err=100; 

nmax=ceil(log2((b - a)/tol) -1 );

fprintf('Maximum number of admissimble iterations %-d \n',nmax);
disp(' ')

while (it < nmax && err > tol) 
    
    it=it+1;
    x = (b+a)/2; %estimate for the zero
    fc = fun(x);     
    
    if (fc == 0)
       err=0;
    else
       err=abs(fc); 
    end
    
    xvect=[xvect;x]; % updating of the solution
    

    % choice of the new extrema for the choice od the interval
    if (fc*fun(a) > 0), 
          a=x; 
    else 
          b=x; 
    end;      
    
end; 

if (it==nmax)
    fprintf('Attention! Maximum number of iterations has been reached! Error on residual %-6.4e \n',err);
else
    fprintf('x_%-d satisfies the tolerance on the residual \n', it);    
end
fprintf('Computed root: %-12.8f \n', xvect(end));
