%% Exercise 2a (additional exercise)
% We can use the Gauss-Seidel method because we are sure it converges. 
% Which feature of the matrix supports this statement?
% 
% Answer:
% The shape of the matrix is as follows:
% 2.001  1         0 ...  0
% 1      2.001  1  0 ...  0
% .                       .
% .                       .
% .                       .
% 0 ...         1  2.001  1 
% 0 ...         0  1      2.001
% 
% The matrix' diagonal elements are bigger than all the other elements,
% therefore the matrix is diagonally dominant. This feature makes it
% possible for us to apply the Gauss-Seidel method.