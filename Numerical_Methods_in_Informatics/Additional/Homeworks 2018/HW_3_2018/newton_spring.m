function [x,niter]=newton_spring(x0,tol,nmax)
niter=1;
err=tol+1;
x=x0;
while(err>=tol && niter<nmax)
    J=J_spring(x);
    y=F_spring(x);
    dx=-J\y;
    x=x+dx;
    err=norm(dx);
    niter=niter+1;
end
res=norm(F_spring(x));
if((niter==nmax && err>tol) || (isnan(res)))
    fprintf('DOES NOT CONVERGE')
else
    fprintf('Converges in %i iiterations and the final residual is %g\n',niter,res);
end