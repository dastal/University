%% Clearing the Environment
clear all;
close all;
clc;

%% Defining the Problem
% Set interval
a = 4;
b = 9;

% Function
f = @(x) 100/sqrt(x);

% Exact result
Iex = 200;

% Defining different Ms
M = zeros(10,1);

for i=1:10
   M(i) = 2^i; 
end

%% Apply Quadrature for different M
% Storage vector for different quadratures
quads = zeros(1,10);

for i=1:10
   quads(i) = myQuadrature(f,a,b,M(i)); 
end

% Compute the error
err = abs(Iex-quads);

%% Plottin
loglog(M,err,"DisplayName","Computed Error");
hold on;
for i=1:4
   loglog(M,1./(M.^i),":","DisplayName","Order "+num2str(i)); 
end
legend("location","southwest");
grid;
xlabel("log(M)");
ylabel("log(Error)");
title("Error Compared to Number of Subintervals");
savefig("quadConvergence.fig");
hold off;
%close;