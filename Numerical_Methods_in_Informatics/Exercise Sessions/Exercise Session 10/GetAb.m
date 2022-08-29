function [A,b] = GetAb(N, h, fun, uL, uB, uR, uT, xx, yy)
    % Function defining the Poisson problem as a linear one
    %
    % Input:
    %       N:    (integer):         the size of the grid's discretisation
    %       h:    (float):           the grid's spacing
    %       fun:  (function handle): the source term
    %       uL:   (function handle): function to apply as a left boundary condition
    %       uR:   (function handle): function to apply as a right boundary condition
    %       uT:   (function handle): function to apply as a top boundary condition
    %       uB:   (function handle): function to apply as a bottom boundary condition
    %       xx:   (N-2xN-2 float):   x coordinates of the discretisation
    %       yy:   (N-2xN-2 float):   y coordinates of the discretisation
    %     
    % Output:
    %       A:    (NxN float): the matrix associated to the problem
    %       b:    (N float):   the second member associated to the problem
    %

    % Using the matlab function
    A = gallery('poisson',N);

    % Defining the b vector
    xx = xx'; yy = yy';                                % Transpose so that  xx(i,j), yy(i,j) are coordinates of (i,j) point
    bMatr = (h^2)*fun(xx,yy);                          % Applying the source term at each grid point
    bMatr(1,:) = bMatr(1,:)+uL(xx(1,:),yy(1,:));       % Applying the left boundary condition
    bMatr(:,1) = bMatr(:,1)+uB(xx(:,end),yy(:,end));   % Applying the bottom boundary condition
    bMatr(N,:) = bMatr(N,:)+uR(xx(end,:),yy(end,:));   % Applying the right boundary condition
    bMatr(:,N) = bMatr(:,N)+uT(xx(:,end),yy(:,end));   % Applying the top boundary condition

    % Rearrange the components of bMatr in a vector shape
    % b= [bMatr(:,1) bMatr(:,2) ... bMatr(:,N)]'; % -> so it is [b_11 b_12 ... b_1N ..  b_21 ...   b_NN]
    b = reshape(bMatr,N*N,1);
    
end