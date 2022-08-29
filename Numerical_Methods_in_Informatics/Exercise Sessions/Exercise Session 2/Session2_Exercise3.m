%% Computes the Bassel problem for a prescribed number of iterations
% Note: starting with it=12000 the value is pi^2/6

% Clearing the workspace
clc
clear all

% Initialisation
% Registering the exact value
exact_value=pi^2/6;
% Specifying the wished number of iterations
n=12000;

% Computing the approximation
y=0;
for k=1:n
    y=y+1/k^2;
end

% Informing the user about the output
fprintf("approximated value = %d\n",y)
fprintf("exact value = %d\n",exact_value)
fprintf("error = %d\n\n",(exact_value-y)/exact_value)


%% Compute the bessel problem until a given tolerance is reached

% Clearing the workspace
clc
clear all

% Specify the wished tolerance
tol=10^(-4);

% Initialising the loop variables
n=0;
y=0;

% Iterating until the wished tolerance is found
while (exact_value-y)/(exact_value)>tol % exit while loop when the approx. error is <tol
    n=n+1;
    y=(1/(n^2))+y;
  end

% Informing the user about the required number of iteration to reach the desired accuracy
fprintf("approximated value = %d\n",y)
fprintf("exact value = %d\n",exact_value)
fprintf("error = %d\n\n",(exact_value-y)/exact_value)

%% Alternative vectorial version for the prescribed iteration number

% Clearing the workspace
clc
clear all

% Computing vectorially
n=12000;
y= sum(1./(1:n).^2);

% Informing the user
fprintf("approximated value = %d\n",y)
fprintf("exact value = %d\n",exact_value)
fprintf("error = %d\n",(exact_value-y)/exact_value)


 
