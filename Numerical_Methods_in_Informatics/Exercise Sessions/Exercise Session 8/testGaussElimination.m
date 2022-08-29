% EXERCISE SESSION 8 - Part 1: Gauss-Jordan Method


%% Clearing
clc; close all; clear all;


%% Matrix construction
A= [1 -1 3;
    1 1  0;
    3 -2 1];
b=[2;4;1];

disp("Gaussian elimination result")
GaussElimination(A,b)
disp("Embedded Matlab backslash")
A\b