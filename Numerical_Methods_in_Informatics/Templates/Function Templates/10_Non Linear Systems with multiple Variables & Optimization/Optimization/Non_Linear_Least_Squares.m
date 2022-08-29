%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%           EXERCISE SESSION 13 - Last one...  :'-(
%
%                   EXERCISE 2 : Gauss-Newton method for
%                       Least Square system solving
%
%                   	b. Signal analysis
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Clearing + initialise
clear all; close all; clc;

a =[2.3 ,3.25 ,4.82 ,5.3 ,6.6]; % Expected values
m = length (a); % Number of superposed signals
sigma =[0.2 ,0.34 ,0.50 ,0.23 ,0.39]; % Standard deviations

n =2000;
tt = linspace(0 ,10 , n)'; % List of the times
yy = zeros(n,1); % List for the signal

% Function handle for the gaussian
gaussian=@(t,a, sigma)exp(-((t-a)/(sqrt(2)*sigma)).^2)/(sqrt(pi*2)*sigma);

% Generation of the signal
for k =1: m
    yy = yy + gaussian(tt,a(k), sigma(k));
end

% Adding a noise
yy = yy +0.05* randn (n ,1);
plot(tt,yy)


%% Finding the parameters a and m with the Gauss-Newton method
m=5;
x0 =[2 ,3 ,4 ,5 ,6 ,0.3 ,0.3 ,0.6 ,0.3 ,0.3]; % Initial guesses

tol =3.e-5;
kmax =200;

[x , err , iter ]= gaussnewton(@gmmR, @gmmJR, x0, tol, kmax,tt, yy);
xa = x (1: m ); % Retrieve the approximated expected values
xsigma = x ( m +1: end ); % Standard deviation
% h =1./( sqrt (2* pi )* xsigma ); 
% w =2* sqrt ( log (4))* xsigma ;

% Reconstruction of the approximated signal
y_pred=zeros(n,1);
for k =1: m
    y_pred = y_pred + gaussian(tt,xa(k), xsigma(k));
end


%% Plotting
plot(tt,yy,'b.')
hold on
plot(tt,y_pred,'r','LineWidth',2)
title('Noisy signal and its reconstruction')
grid
xlabel('t')
ylabel('Amplitude of the signal')
legend('Noisy input signal','Reconstructed signal')


%% Functions definition
function [ R ]= gmmR (x ,t , y ) % Function to minimze
x = x(:);
m = length(x)/2;
a = x(1:m);
sigma = x(m+1:end);
n = length(t);
R = zeros(n,1);
gaussian=@(t,a,sigma)[exp(-((t-a)/(sqrt(2)*sigma))...
    .^2)/(sqrt(pi*2)*sigma)];
for k =1: m
    R = R + gaussian (t,a(k),sigma(k)); 
end
R =R - y;
end

function [ Jr]=gmmJR(x,t,y) % Associated Jacobian
x = x(:);
m = length(x)/2;
a = x(1:m);
sigma = x(m+1:end);
n = length(t);
Jr = zeros(n,m*2);
gaussian=@(t,a,sigma)[exp(-((t-a)/(sqrt(2)*sigma))...
    .^2)/(sqrt(pi*2)*sigma)];
fk=zeros(n,m);
for k=1:m
    fk (:,k)= gaussian(t,a(k),sigma(k));
    Jr(:,k)=(fk(:,k).*(t-a(k))/sigma(k)^2)';
    Jr (:,k+m)=(fk(:,k).*((t-a(k)).^2/...
        sigma(k)^3-1/(2*sigma(k))))'; 
end
end
