%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Solving a Poisson problem with the relaxation method            %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% NOTE: To consider each part of the exercise, you can use the "run
% section" tool of matlab.


%% Cleaning the environment
clear all;
close all;
clc;


%% Defining the problem of interest

% Defining the problem and the wished parameters for its resolution
u_ex = @(x,y) exp(x+y/2);         % Defining the exact solution of the problem
fun  = @(x,y) 1.25*exp(x+y/2);    % Investigated source function in the posson problem
uL   = @(x,y) exp(y/2);           % Boundary conditions: uLeft     for x=0
uR   = @(x,y) exp(1+y/2);         % Boundary conditions: uRight    for x=1
uB   = @(x,y) exp(x);             % Boundary conditions: uBottom   for y=0
uT   = @(x,y) exp(x+1/2);         % Boundary conditions: uTop      for y=1
a=0;b=1;c=0;d=1;                  % Investigating the solution in the unit square



%% Define the discretisation, generate the matrix and compare it with the matlab's construction

% Number of wished subintervals per dimension (uniform grid discretisation)
N = 40;                          

% Generating the grid discretisation
x = linspace(a,b,N+2);                        % Spacing vector for x direction
y = linspace(c,d,N+2);                        % Spacing vector for y direction
h = x(2)-x(1);                                % Computing the spacing
[xx,yy] = meshgrid(x(2:end-1),y(2:end-1));    % Creating the grid discretisation excluding the boundaries
[xxb,yyb] = meshgrid(x,y);    % Creating the grid discretisation excluding the boundaries

% Plotting the discretisation
fig = figure();
hold on
mesh(xx,yy,0*xx)                              % Plotting the mesh as a zero-wireframe solution
view(0,90)                                    % Projecting on a 2D visualisation
plot(xx,yy,"*r")                              % Plotting the nodes
plot([a,b,b,a,a],[c,c,d,d,c],"-k")            % Plotting the domain
hold off
axis([a-0.1, b+0.1, c-0.1, d+0.1])            % Adjusting the visualisation bounding box
title("Mesh in use for solving the problem")  % Customisations
xlabel("x"); ylabel("y")
legend("Mesh","Nodes")

% Constructing the vector b over the designated grid
xx = xx'; yy = yy';                                % Transpose so that  xx(i,j), yy(i,j) are coordinates of (i,j) point
bMatr = (h^2)*fun(xx,yy);                          % Applying the source term at each grid point
bMatr(1,:) = bMatr(1,:)+uL(xx(1,:),yy(1,:));       % Applying the left boundary condition
bMatr(:,1) = bMatr(:,1)+uB(xx(:,end),yy(:,end));   % Applying the bottom boundary condition
bMatr(N,:) = bMatr(N,:)+uR(xx(end,:),yy(end,:));   % Applying the right boundary condition
bMatr(:,N) = bMatr(:,N)+uT(xx(:,end),yy(:,end));   % Applying the top boundary condition

% Rearrange the components of bMatr in a vector shape
% b= [bMatr(:,1) bMatr(:,2) ... bMatr(:,N)]'; % -> so it is [b_11 b_12 ... b_1N ..  b_21 ...   b_NN]
b = reshape(bMatr,N*N,1);

% Construct the matrix A
A = ConstructA(N);

% Compare it with the matrix retrieved from Matlab
A1 = gallery('poisson',N);

fprintf("Matrices construction comparison, %f\n", max(max(abs(A-A1))));

%% Solving a first problem with the relaxation method

% Define the parameters to use in the relaxation method
x0    = b*0;                % Set initial guess as zero
omega = 2/(1+sin(pi*h));    % Set the relaxation parameter
Nmax  = 2000;               % Set the maximum number of iterations
tol   = 1e-16;               % Set the stopping criterion

% Solve the problem using the SOR method
[u_grd,it] = relaxmeth(A, b, x0, Nmax, tol, omega);

% Reshape the solution to plot it on a grid
uapprox = reshape(u_grd,N,N);

% Compute the exact solution to the problem
uexact  = u_ex(xx,yy);

% Compute and display the error between the two solutions
errmax = max(max(abs(uapprox-uexact)));  
fprintf('Maximum error point-wise = %.5e \n',errmax)

% Plot the solutions
fig = figure();
subplot(1,2,1);
surf(xx,yy,uexact);
xlabel('x');ylabel('y');
daspect([1 1 1])

title('Exact')
subplot(1,2,2);
surf(xx,yy,uapprox);
title('Approximation')
daspect([1 1 1])

% plot error:
fig = figure();
contour(xx,yy, abs(uapprox-uexact),30)
axis([0 1 0 1])
daspect([1 1 1])
title('Error ontour plot')
xlabel('x'); ylabel('y');
colorbar();


%% Investigating the error behaviour of the method parameter

% Defining the vector of omega and refinement of interest
Omega = 1:0.05:1.9;

% Defining the vector of disretisation to consider
a1=0;a2=1;c=0;d=1;     % Investigating the solution in the unit square
n=20;

% Loop on both and fill the error vector
tol   = 1e-6;                                % Defining the fixed SOR parameter
Nmax  = 400;                                % Hard stopping criterion
err  = zeros(length(Nmax), length(Omega));    % Initialising the error vector
nbit = zeros(length(Omega));

for o=1:length(Omega)
    
    % Retrieving the parameters
    omega = Omega(o);

    % Creating the discretisation
    x = linspace(a1,a2,n+2);                      % Spacing vector for x direction
    y = linspace(c,d,n+2);                        % Spacing vector for y direction
    h = x(2)-x(1);                                % Computing the spacing
    [xx,yy] = meshgrid(x(2:end-1),y(2:end-1));    % Creating the grid discretisation excluding the boundaries

    % Creating the problem's matrix
    [A,b] = GetAb(n, h, fun, uL, uB, uR, uT, xx, yy);

    % Setting the initial guess to 0
    x0    = b*0;

    % Solbing the problem with the SOR method
    [u_grd, hist,it] = relaxmeth(A, b, x0, Nmax, tol, omega);

    % Reshape the solution to plot it on a grid
    uapprox = reshape(u_grd,n,n);
    
    % Compute the exact solution to the problem
    uexact  = u_ex(xx,yy);
    
    % Compute and display the error between the two solutions
    err(1:it+1,o) = squeeze(max(max(abs(reshape(hist,n,n, it+1)-uexact))));
    nbit(o) = it;

    % Display the user an on-going message
    fprintf('Solution for n=%d and omega=%4.3f computed in %d steps.\n', n, omega, it);

end

% Plot a convergence rate for the sake of the example
fig = figure();
semilogy(1:nbit(1)+1, err(1:nbit(1)+1,5), "r-*")
xlabel("h"); ylabel("err");
title('Convergence rate using omega=Omega(5)')


%% Guessing the optimal relaxation parameter

% Initialising the order storage
order = zeros(1,length(Omega));

% Deriving the convergence order of the method for a given omega
for o=1:length(Omega)
    % Get the convergence rate
    a = polyfit(1:nbit(o)+1, log(err(1:nbit(o)+1,o)'), 1);
    order(o) = a(1);
end

% Plot the convergence rates over the SOR parameter
fig = figure();
hold on
plot(Omega, order, '--or')
hold off
xlabel("Omega"); ylabel("Order");
title('Convergence rate over the SOR parameter')
