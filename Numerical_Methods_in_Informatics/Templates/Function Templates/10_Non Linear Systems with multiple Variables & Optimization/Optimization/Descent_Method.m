function [x] = descentMeth(x0,fun,gfun, tol, itMax)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x = x0;
% Get Hessian of fun
%to be inserted
H = hessian(fun);
%
it = 0;
err = 1 + tol;
while (err >= tol) && (it < itMax)
    gr_x = gfun(x);
    d = -x;
    a = (d' * gr_x) / (d' * H * d);
    x = x + (a * d);
    err = norm(gr_x);
end
end

