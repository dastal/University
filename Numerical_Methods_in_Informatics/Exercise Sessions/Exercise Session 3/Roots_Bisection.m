%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Script of the exercise 3a                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Defining the problem under consideration

% Defining the function of interest
f1 = @(x) 2*cos(3*x)-exp(x);

% Defining the target interval
x0 = 0;
x1 = 2;

% Defining the desired tolerance
tol = 1e-8;

%% Finding the root of the function

% Call to the bisection function
[x, it] = Bisection(f1,x0,x1,tol);

% User information
fprintf("\nAfter %d iterations, the found root is located at x=%f.\n", it, x);

%% Plotting the function and its found root

% Plot definition
fig = figure();
hold on
plot(linspace(-5,5,100), f1(linspace(-5,5,100)))
plot(x, f1(x), "or")
hold off

% Plot customisation
legend("Considered function", "Found root")
xlabel("x")
ylabel("y")
title("Plot of f1 and its root found by bisection")

%% Observation

% We miss a lot of roots since the function is not monotoneous