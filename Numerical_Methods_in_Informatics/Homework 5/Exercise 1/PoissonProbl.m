%% Clearing Environment
clear all;
close all;
clc;

%% Parameters
% Number of internal points
N = 20;

% Step
h = 1/(N+1);

% x or y coordinate excluding boundaries
xCoord=(h:h:(N*h))';
yCoord=(h:h:(N*h))';

% Generate a mesh 2D
[X,Y] = meshgrid(xCoord,yCoord);

% transpose, such that X(i,j), Y(i,j) are coordinates of (i,j) point
% because in Matlab first index refers to the row number -> Y axis
%               second index refers to the column number -> X axis

X = X';
Y = Y';

% load of intensity: g(x,y)
fun = @(x,y) 8*pi*pi*sin(2*pi*x).*cos(2*pi*y);

% Right hand term matrix
bMatr = h^2*fun(X,Y);

% Boundary conditions    
uL   = 0;                                        % Boundary conditions: uLeft     for x=0
uR   = 0;                                        % Boundary conditions: uRight    for x=1
uB   = sin(2*pi*xCoord);                         % Boundary conditions: uBottom   for y=0
uT   = sin(2*pi*xCoord);                         % Boundary conditions: uTop      for y=1

% Add to b
bMatr(:,1) = bMatr(:,1)+uB;
bMatr(:,N) = bMatr(:,N)+uT;

% re-arrange the components of bMatr in a vector (lexicograpical)
% -> so it is (b_11 b_12 ... b_1N ... b_21 ... b_NN)
b = reshape(bMatr,N*N,1);

% using Matlab gallery
A = gallery('poisson',N);

%% Solving 1c) and 1e)
% Parameters
x0 = b*0;
tol = 1e-6;
itMax = 500;

% 1c)
[u_grd1,it1,hist1] = gradmeth(A,b,x0,tol,itMax,false);

% 1e)
[u_grd2,it2,hist2] = gradmeth(A,b,x0,tol,itMax,true);

% reshape
u2d1 = reshape(u_grd1,N,N);
u2d2 = reshape(u_grd2,N,N);

% Exact solution
u_ex = sin(2*pi*X).*cos(2*pi*Y);

% Error of normal Gradient Method Version
err1 = u2d1-u_ex;
errNodal1 = max(max(abs(err1)));
fprintf("Gradient Method:\n");
fprintf("The required number of iterations is %d and the obtained error is %5e.\n",it1,errNodal1);

% Error of evem-odd Gradient Method Version
err2 = u2d2-u_ex;
errNodal2 = max(max(abs(err2)));
fprintf("Gradient Method, even-odd Version:\n");
fprintf("The required number of iterations is %d and the obtained error is %5e.\n",it2,errNodal2);

%% Plot results
% Plot grid:
% plot(X,Y,'g'); plot(X',Y','g');

% Creating mesh INCLUDING boundary points
xExt = [0; xCoord; xCoord(N)+h];
yExt = [0; yCoord; yCoord(N)+h];
[Xe,Ye] = meshgrid(xExt,yExt);

uExt(2:N+1,2:N+1) = u2d2;
uExt(1,:) = 0;
uExt(N+2,:) = 0;
uExt(2:N+1,1) = uB;
uExt(2:N+1,N+2) = uT;

% plot solution
meshc(Xe',Ye',uExt);
hold on;
surf(Xe',Ye',uExt);
xlabel('x');
ylabel('y');
zlabel('u');
title('Contour plot of computed solution');
savefig("approximation.fig");
hold off;
close;

%% Convergence 1f)
semilogy(1:it1,hist1(1:it1));
hold on;
semilogy(1:it2,hist2(1:it2));
yline(tol);
ylim([tol/2,2]);
grid on;
legend(["Gradient Method", "Gradient Mehtod (even-odd Version)", "Target Tolerance (tol)"]);
title("Comparison of the Convergence");
xlabel("Iteration");
ylabel("Error estimator ||r||/||r_0||");
savefig("errorEstimators.fig");
hold off;
close;
