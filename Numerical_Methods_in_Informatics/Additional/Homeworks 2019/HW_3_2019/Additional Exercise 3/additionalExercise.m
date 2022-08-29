%% Clearing Environment
clear all;
close all;
clc;

%% Defining the matrix
% Linear System to be solved: 
% Required Material Units)*Required total Material=Created Parts

% Materials Matrix
Material = [6, 2, 4;        % copper
            6, 3, 5;        % zinc
            2, 1, 4];       % glass
% Transistors, Resistors, Computer Chips

% Required total Material Vectors c1 and c2
c1 = [210; 95; 235];
c2 = [220; 105; 190];
 
%% Solving the problems using the LU factorisation
% LU factorisation
[L,U] = lu(Material');
 
% Forward Backward Substitution of the first problem 
x1 = Substitution(L,U,c1);

% Printing the first result
fprintf("For the first problem: \nThe total created amount of transistors is: " + num2str(x1(1)) + "\nThe total created amount of resistors is: " + num2str(x1(2)) + "\nThe total created amount of computer chips is: " + num2str(x1(3)) + ".\n\n");

% Forward Backward Substitution of the second problem 
x2 = Substitution(L,U,c2);

% Printing the second result
fprintf("For the first problem: \nThe total created amount of transistors is: " + num2str(x2(1)) + "\nThe total created amount of resistors is: " + num2str(x2(2)) + "\nThe total created amount of computer chips is: " + num2str(x2(3)) + ".\n\n");

%% Function for the Substitution
function [x] = Substitution(L,U,b)
    % Forward-Backward Substitution
    % LUx=b
    
    % Getting the size of the system
    [n,~] = size(L);
    
    % Initializing
    y = zeros(n,1);
    x = zeros(n,1);
    
    % Forward Substitution
    for i=1:n
        y(i) = (1./L(i,i))*(b(i)-L(i,1:i-1)*y(1:i-1));
    end
    y=y';
    
    % Backward Substitution
    for i=n:-1:1
       x(i) = (1/U(i,i))*(y(i)-U(i,i+1:n)*x(i+1:n)); 
    end
end