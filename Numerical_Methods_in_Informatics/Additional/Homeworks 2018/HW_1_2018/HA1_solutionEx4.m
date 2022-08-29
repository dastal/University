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


%% Exercise 4)

clear all
close all
clc

dim =[]; % initialization of the vector containing the dimensions used for the computations
time = []; % initialization of the vector with the effective (cpu) time used for the computation

for n=1000:100:5000
    v=rand(n,1);
    A=vander(v);
    
    t0=cputime; % initialize timing
    [L,U]=lu(A); % operation
    t1=cputime; % finalize timing
    dt=t1-t0; % compute the timelapse occured for the computation
    
    dim = [dim; n]; % add the used dimension to the vector dim
    time = [time; dt]; % add the needed cputime to the vector time
        
end

plot(dim, time(:,1), 'o-')
legend('CPU TIME','Location','NorthWest')
title('CPU time for LU factorization of the Vandermonde matrix of dimension n')
xlabel('n')
ylabel('time [s]')