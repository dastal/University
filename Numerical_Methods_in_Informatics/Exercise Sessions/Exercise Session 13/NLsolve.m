%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%           EXERCISE SESSION 13 - Last one...  :'-(
%
%                   EXERCISE 1 : Non linear system solving
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Clearing + initialise
clear all; close all; clc;

% Function definiton for the system
f1 = @(x1,x2,x3) 3*x1 - cos(x2.*x3) - 0.5; % (Right hand terms are substracted)
f2 = @(x1,x2,x3) x1.*x1-81*(x2+0.1).^2 + sin(x3) + 1.06;
f3 = @(x1,x2,x3) exp(-x1.*x2) + 20*x3 + (10*pi-3)/3;

% Vectorial function
F  = @(x1,x2,x3) [f1(x1,x2,x3);f2(x1,x2,x3);f3(x1,x2,x3)];

% Jacobian matrix
JF=@(x1,x2,x3) [3              , x3*sin(x2*x3)  , x2*sin(x2*x3)      ;...
                2*x1           , -2*81*(x2+0.1) , cos(x3)            ;...
                -x2*exp(-x1*x2), -x1*exp(-x1*x2), 20                 ];

%% Quick plotting to understand those objects - NOT FOR THE EXAM!
figure()
fimplicit3(f1,[-2,2],'r','EdgeColor','none','FaceAlpha',0.5)
hold on
fimplicit3(f2,[-2,2],'g','EdgeColor','none','FaceAlpha',0.5)
fimplicit3(f3,[-2,2],'b','EdgeColor','none','FaceAlpha',0.5)
legend('f1','f2','f3')
% It seems that at least one solution is possible.


%% Solving the system using newtonsys.m
x0=[0.1;0.1;-0.1]; % Initial guess
tol=1e-8;          % Tolerance

[x,res,niter]=newtonsys(F,JF,x0,tol,1000);

if norm(F(x(1),x(2),x(3)))<1e-5
    disp("Solution found:")
    disp(x')
    fprintf("Within %d iterations.\n",niter)
end

plot3(x(1),x(2),x(3),'ko','MarkerSize',10,'DisplayName','Solution found')