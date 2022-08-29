%% Clearing the Environment
close all;
clear all;
clc;

%% Defining the Problem
% Matrix B
B = [0 1/3 -2/3;
    0 0 4/5;
    0 1/9 2/45];

% Computing rho(B)
eigs = eig(B);
rhoB = max(abs(eigs));

disp(rhoB);

%% Iterations needed to reduce the error by a factor 10
kmin = log10(1/10)/log10(rhoB);

disp(ceil(kmin));