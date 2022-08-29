%% Clear the environment
close all;
clear all;
clc;

%% Define Matrix A
A = [3 -1 2;
    0 5 -4;
    -1 -1 3];

disp(det(A));
disp(A^-1*A);
disp(A*A^-1);

% Condition Number
cA = norm(A-1,1)*norm(A,1);
disp(cA);