%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
%            
%                            SOLUTION 1st Homework Assignment              
%                            
%                                        in 
%
%                      Numerical Methods for  Scientific Computing
%
%
%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Exercise 3)

close all 
clear all
clc

% definition of the matrix and the known term to be used
A=[50 1 3;
    1 6 0;
    3 0 1];

n=size(A,1);

I=eye(n);
Ainv=[];


for i=1:n
    [A_m,b]=fwsub(A,I(:,i));
    xn=bksub(A_m,b);
    
    Ainv=[Ainv, xn];
end

% Check if the obtained result is correct: I=A*A^(-1)
Id=A*Ainv;

% Check of roundoff errors
eye(3)-Id
disp('the roundoff errors are of epsilon machine size')
disp('')
disp('')
disp('Comparison between the computed inverse and the one from Matlab inbuilt function')
Ainv
inv(A)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Alternative to the solution above 
% Note: to run it comment via '%' each line above and delete in the
% following lines the '%' 

% close all 
% clear all
% clc
% 
% % definition of the matrix and the known term to be used
% A=[50 1 3;
%     1 6 0;
%     3 0 1];
% 
% n=size(A,1);
% 
% I=eye(n);
% Ainv=[];
% [L,U]=lu(A);
% 
% 
% for i=1:n
%     yn=fwsub_LU(L, I(:,i));
%     xn=bksub(U,yn);
%     
%     Ainv=[Ainv, xn];
% end
% 
%  
% % Check if the obtained result is correct: I=A*A^(-1)
%  Id=A*Ainv;
% 
% % Check of roundoff errors
%  eye(3)-Id
%  disp('the roundoff errors are of epsilon machine size')
%  disp('')
%  disp('')
%  disp('Comparison between the computed inverse and the one from Matlab inbuilt function')
%  Ainv
%  inv(A)

% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%