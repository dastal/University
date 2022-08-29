%% Clear the environment
close all;
clear all;
clc;

%% Defining Matrix B
B = [0 1/3 -2/3;
    0 0 4/5;
    0 1/9 2/45];

e = eig(B);

rhoB = max(abs(e));

disp(rhoB);

%% Computing the minimum iterations to reduce the initial error by a factor of 10
kmin = log10(1/10)/log10(rhoB);

disp(ceil(kmin));
