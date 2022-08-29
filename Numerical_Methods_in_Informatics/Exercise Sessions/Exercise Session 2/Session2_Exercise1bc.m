%% Setting up the test problem

% Defining the function to test the derivative onto and its derivative
f =@(x) sin(x);
df=@(x) cos(x);

% Defining the test parameters
% Point of evaluation
x0=1.2;
% Number of test cases for h
N=20;

%% Evaluate the exact solution
exdf=df(x0);

%% Loop over the given h and get the respective error of the approximation

% Initialising the vectors receiving the outputs
hs=zeros(N,1);
app_df=zeros(N,1);
errors=zeros(N,1);

% Loop over the test cases (determining h through the value of N)
for k=1:N
    % Retrieve h from N
    h=1/2^k;
    % Retrieve the associated error
    app_df(k)=approx_der(f,x0,h);
    hs(k)=h;
    errors(k)=abs(exdf-app_df(k));
end

% Plot the obtained error against h
plot(hs,errors)
