function [coeffs] = FindInterp(x1, x2, y1, y2, y3, Q)
    %polynomial: p3(x) = a + b x + c x^2 + d x^3
    % that int[-1,1]p3(x) dx = Q
    
    % Matrix A
    A = [x1^3 x1^2 x1 1 ;
        x2^3 x2^2 x2 1 ;
        1 1 1 1 ;
        0 2/3 0 2 ];
    
    % Vector b
    b = [y1; y2; y3; Q];
    
    % Computing the Coefficients
    coeffs = A\b;
end
