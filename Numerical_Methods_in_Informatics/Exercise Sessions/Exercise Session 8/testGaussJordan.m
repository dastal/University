% EXERCISE SESSION 8 - Part 1: Gauss-Jordan Method


%% Clearing
clc; close all; clear all;


%% Simple test
A=eye(3);b=(1:3)';
GaussJordan(A,b)
A\b
fprintf("\n")

A=rand(3);b=ones(3,1);
GaussJordan(A,b)
A\b
fprintf("\n")

% A=[1 1;-1 1];b=ones(2,1);
% GaussJordan(A,b)
% A\b
% fprintf("\n")


%% Complexity analysis
N=9 % Max exponent
nn=2.^[1:N];
ttime=zeros(N,1);
for i=1:N
    tic;
    GaussJordan(rand(nn(i)),rand(nn(i),1));
    ttime(i,1)=toc;
end

%% Plotting
figure
loglog(nn,ttime)
hold on
loglog(nn,1e-4*nn.^3)
loglog(nn,1e-4*nn.^2)
grid
xlabel('Size of the matrix n')
ylabel('Computational time')
title('Complexity of Gauss-Jordan method')
legend('Tic-toc time','Order 3','Order 2')