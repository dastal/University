function [x, it, NPiv, res] = newtonMeth(Ffun, JFfun, x0, tol, itMax)
    %NEWTONSYS Finds a zero of a nonlinear system...
    %% Parameters
    % Initialize interaion parameter
    it = 0;
    
    % Initialze error
    err = tol + 1;
    
    % Hand over x0 to x
    x = x0;
    
    % Initialize NPiv
    NPiv = 0;
    
    %% Newton's method
    while err >= tol && it < itMax
        J = JFfun(x);
        F = Ffun(x);
        [L,U,P] = lu(J);
        y = -L\F;
        delta = U\y;
        if P~=eye(2)
           NPiv = NPiv+1;
        end
        x = x+delta;
        it = it+1;
        err = norm(delta);
    end
    
    res = norm(Ffun(x),inf);
end
