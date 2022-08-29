% EXERCISE SESSION 8 - Part 1: Gauss-Jordan Method


%% Clearing
clc; close all; clear all;


%% Matrix construction
A=  [6     6     2;
     2     3     1;
     4     5     4];
%% Determinant/rank of A:
fprintf("\nThe rank of A is %d. \n",rank(A));
fprintf("The determinant of A is %g. \n",det(A))

%% Norms
fprintf("\nThe l_1 norm of A is %d. \n",norm(A,1));
fprintf("The l_inf norm of A is %d. \n",norm(A,Inf));

%% Principal submatrices
det1=A(1,1)
det2=det(A(1:2,1:2))
if det1*det2
    disp("All sub-matrices are non-singular")
else
    disp("A sub-matrix is singular...")
end

%% LU decomposition
[L,U,P]=lu(A) % WARNING the permutation needed is stored in P
% This "[L,U,P]=lu(A)" instead of "[L,U]=lu(A)", makes L triangular and
% retrieves also the information about the needed permutation in P.
% (Here, in "[L,U]=lu(A)" notation, L wouldn't be triangular but
%  a PERMUTED triangular matrix (P*L) ).

%% Determinant using LU
fprintf("\nThe determinant with LU decomposition is: %g.\n",...
    prod(diag(U))*det(P)); % P affects the determinant

%% Solution the problem
b1=[210;95;235];
b2=[220;105;190];

% First case
y1=L\P*b1; % Need to consider also the permutation P.
x1=U\y1;
fprintf("\nProducts available in first case:\n")
fprintf("%g transistor, %g resistor, %g computer\n",(x1))

% Second case
y2=L\P*b2;
x2=U\y2;
fprintf("\nProducts available in second case:\n")
fprintf("%g transistor, %g resistor, %g computer\n",(x2))


