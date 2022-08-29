
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
%            
%                            SOLUTION 2nd Homework Assignment              
%                            
%                                        in 
%
%                      Numerical Methods for  Scientific Computing
%
%
%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Exercise 2

clear all
close all
clc

% Ex 2a)
n=7;

A=diag(9*ones(1,n))+diag(-3*ones(1,n-1),1)+diag(-3*ones(1,n-1),-1)+...
    diag(ones(1,n-2),2)+diag(ones(1,n-2),-2)
b=[7 4 5 5 5 4 7]';

% Ex 2b) 
% Check on the strict diagonal dominance by rows
Adiag=diag(abs(A));
Aout_diag=sum(abs(A),2)-diag(abs(A));
if (Adiag>=Aout_diag)
    disp('Matrix A has a strict diagonal dominance by rows')
else 
    disp('Matrix A has NOT a strict diagonal dominance by rows')
end

% Ex 2c)
% Check on the SPD properties of matrices
if (A==A')
    disp('Matrix A is symmetical')
    na=size(A,1);
    if (det(A(1:na-1,1:na-1))>0)
        disp('Matrix A is positive definite')
    else
        error('Matrix A is NOT positive definite')
    end
else disp('Matrix A is NOT SYMMETRICAL')
end



