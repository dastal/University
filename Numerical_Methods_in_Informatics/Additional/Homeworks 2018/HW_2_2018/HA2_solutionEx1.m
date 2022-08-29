
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

%% Exercise 1


A=vander(rand(1,1000));
B=rand(1000);

% Ex 1a)
% Solution of the two systems
x_ex=ones(1000,1);
y_ex=ones(1000,1);

b=A*x_ex;
c=B*y_ex;

% Ex 1b)
% Backslash -solution
x=A\b;
y=B\c;


% Ex 1c)
% Computation of relative errors
rel_errA=abs(x-x_ex)./abs(x_ex);
rel_errB=abs(y-y_ex)./abs(y_ex);

% Ex 1d)
% Plot of condition number for different dimensions of the Vandermonde
% matrix
N=[2:1:50];
K=zeros(size(N));
for i=1:length(N)
    K(i)=cond(vander(rand(1,i)));
end

semilogy(N,K)
grid on
title('Condition number for the Vandermonde matrix')
xlabel('n')
ylabel('cond(V)')
