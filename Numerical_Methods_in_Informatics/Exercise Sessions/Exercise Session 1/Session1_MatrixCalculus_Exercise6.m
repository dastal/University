%% Construct a chessboard from a random matrix

% Define the integer n used to test several cases
n = 4;

% Generate a random matrix
A=rand(n);

% Create a zero matrix 
B=zeros(n,n);

% Create the chessboard pattern: some elements of A will be copied into B.
% Alternatively, we could have copied A and set some elements to 0

% We take elements from either odd rows and odd columns
B(1:2:n,1:2:n)=A(1:2:n,1:2:n);

% or even rows and even columns.
B(2:2:n,2:2:n)=A(2:2:n,2:2:n);

% Spy the matrix to see the structure!
spy(B);



