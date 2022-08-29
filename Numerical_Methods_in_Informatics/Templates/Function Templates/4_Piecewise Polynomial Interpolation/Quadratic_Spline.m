function [coeff] = Quadratic_Spline(nodes)
    % Function computing the coefficients of the quadratic spline in
    % the form si(x) = ai+bi(x-xi)+ci(x-xi)^2
    % 
    % Input:
    %          Nodes (nx2 floats):  the nodes (abscissa and values) to be
    %          used to build the quadratic interpolation
    %
    % Output:
    %          coeff  (n x 3 floats):  the matrix containing the
    %          coefficents [c0 b0 a0]  associated to each node on a row
    %
    %

    %% Initialisations
    
    % Retrieving the number of given nodes
    n = length(nodes);
    
    % Computing the horizontal gap vector
    h = nodes(2:end,1)-nodes(1:end-1,1);
    
    %% Computing the coefficients ai
    a = nodes(1:end-1,2);
    
    %% Computing the coefficients  bi and ci
    
    
    % Computing the coefficients ci
    c = zeros(n-1,1);
    for k = 2:(n-1)
        c(k) = (1./h(k)).*((nodes(k+1,2)-nodes(k,2))./h(k)-(nodes(k,2)-nodes(k-1,2))./h(k-1)-c(k-1).*h(k-1));
    end
    
    % Computing b knowing c
    b = (nodes(2:end,2)-nodes(1:end-1,2))./h-c.*h;
    
    %% Concatenating the coefficients in  the matrix coeff
    coeff = [a'; b'; c']';
    
end