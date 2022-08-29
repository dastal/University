function [coeff] = QuadraticSpline_Solver(nodes)
    % Function computing the coefficients of the quadratic spline in
    % the form si(x) = ai+bi(x-xi)+ci(x-xi)^2
    % 
    % Input:
    %          Nodes (nx2 floats):  the nodes (abscissa and values) to be
    %          used to build the quadratic interpolation, there will be n-1
    %          subsegments on which each interpolating curve is a quadratic
    %          one
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
    h = nodes(2:end)-nodes(1:end-1);
    
    
    %% Creating the matrix giving the conditions/constraints
    
    % Initialising the matrix and the vector
    A = zeros(3*(n-1));
    b = zeros(3*(n-1),1);
    
    % Filling the matrix with the constraints on the continuity
    for k = 1:n-1
      A((1+2*(k-1)):(2+2*(k-1)),(1+3*(k-1)):(1+3*(k-1))) = 1;
      A(1+2*(k-1):2+2*(k-1),2+3*(k-1):3+3*(k-1)) = [nodes(k,1), nodes(k,1).^2; nodes(k+1,1), nodes(k+1,1).^2];
    end
    
    
    % Filling the matrix and vector with the constraints on the derivatives
    for k = 1:n-2
        A(2*(n-1)+k,3*(k-1)+2) = 1;
        A(2*(n-1)+k,3*(k-1)+3) = 2*nodes(k+1,1);
        A(2*(n-1)+k,3*k+2) = -1;
        A(2*(n-1)+k,3*k+3) = -2*nodes(k+1,1);
    end
    
    % Filling the matrix and vector with the constraints at start point
    A(end,3) = 1;
    
    % Filling the vector with the constraints on the continuity 
    % (the constraints on the derivates are zero when written in the form above)
    b(1) = nodes(1,2); b(2*(n-1)) = nodes(end,2);
    for k = 1:n-2
        b(2*(k):1+2*(k)) = nodes(k+1,2);
    end
            
    %% Retrieving the coefficients by solving the system
    % Solving the linear system and getting the coefficients [a0 b0 c0 a1 b1 c1 .... ]
    coeff = A\b;
    
    % Reshaping the coefficients in a matrix ready to be evaluated
    coeff = reshape(coeff, 3,n-1)';
end