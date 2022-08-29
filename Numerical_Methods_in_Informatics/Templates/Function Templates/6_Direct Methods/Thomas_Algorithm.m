function [xs] = Thomas_Algorithm(A,b)
    % LU fatorization in Thomas algorithm
    alphas = zeros(n,1);
    betas = zeros(n,1);

    a = diag(A);
    e = [0 diag(A,-1)']';
    c = diag(A,1);

    alphas(1) = a(1);

    for i=2:n
        betas(i) = e(i)/alphas(i-1);
        alphas(i) = a(i)-betas(i)*c(i-1);
    end

    % Forward Substitution
    ys = zeros(n,1);

    ys(1) = b(1);

    for i=2:n
       ys(i) = b(i)-betas(i)*ys(i-1); 
    end

    % Backward Substitution
    xs = zeros(n,1);

    xs(n) = ys(n)/alphas(n);

    for i=(n-1):-1:1
       xs(i) = (ys(i)-c(i)*xs(i+1))/alphas(i);
    end
end

