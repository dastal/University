%%%%%%%%%%%%% Script corresponding to the additional exercise 3 %%%%%%%%%%%%%%%%%%

%% Clearing up
clear all
close all
clc

%% Setting the problem up

% Defining the matrix A
A = [5 -12 3;
     -3 9  1;
     2 -1 -7];
 
% Defining the vector b
b = [1,2,3]';


%% Setting the solver up 

% Setting the solver parameter
eps = 0.0001;
x0  = b;
Nmax = 1000;
tol  = 1e-6;

% Build the iteration matrix
D = diag(diag(A));
E = -tril(A,-1);
invP = @(omega) inv((D - omega*E)/omega);

%% Studying the spectral radius

% Setting the values of omega under our interest
Omega = [0:0.01:2];

% Getting the spectral radius of P for different values of omega (bad habit quick non vectorized way)
%spr=[];
%for o=Omega
%    spr = [spr,max(abs(eig(invP(o))))];
%end

% Plot the graph of the spectral radius vs omega value
%fig = figure()
%plot(Omega, spr, "--*")
%title("Investigation of the iteration matrix")
%xlabel("omega")
%ylabel('spectral radius')



%% Guessing the optimal relaxation parameter

for o=1:length(Omega)
    
    % Retrieving the parameters
    omega = Omega(o);

    % Solbing the problem with the SOR method
    [x, hist,it] = relaxmeth(A, b, b, Nmax, tol, omega);

    % Compute the residual
    r = b-A*x;
    
    % Compute and display the error between the two solutions
    for k=1:it+1
        err(k,o) = norm(b-A*hist(:,k));
    end
    nbit(o) = it;

    % Display the user an on-going message
    fprintf('Solution for omega=%4.3f computed in %d steps: %e\n', omega, it, err(it+1, o));

end


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
savefig("ConvergenceRate.fig");
hold off;
close;
