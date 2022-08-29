%% Define first the asked random matrix
A = rand(10) 

%% Understand the output of
diag(diag(A)) + diag(diag(A,1),1)+ diag(diag(A,2),2)
