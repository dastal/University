% clear
clear all;
close all;
clc;

%% Improvement for Exercise 2a
% Parameters
n = 10000;
resL = 0;
exactValue = 10^3;

% computing the sum in a loop
tic
for i = 1:n
    resL = resL + 1./10;
end
timeLoop = toc;

% computing the sum in a "vectorization spirit"
tic
toSum = (0.1).*ones(1,n);
resV = sum(toSum);
timeVector = toc;

% actual improvement:
tic
values = 0.1.*ones(100,100);
resVImproved = sum(sum(values));
timeVectorImproved = toc;

% or
tic
vector1 = 0.1.*ones(1,10000);
vector2 = ones(10000,1);
resVImproved2 = vector1*vector2;
timeVectorImproved2 = toc;

% computing the relative errors of resL and resV
errVec =  abs(exactValue - resV)./exactValue;
errLoop = abs(exactValue - resL)./exactValue;

% computing the error with the improved vector
errVecImproved = abs(exactValue - resVImproved)./exactValue;
errVecImproved2 = abs(exactValue - resVImproved2)./exactValue;

% displaying errors
msgErrVec = ['The relative error of the vectorization is ' num2str(errVec) ' in ' num2str(timeVector) ' seconds.'];
disp(msgErrVec);
msgErrLoop = ['The relative error of the loop is ' num2str(errLoop) ' in ' num2str(timeLoop) ' seconds.'];
disp(msgErrLoop);

% displaying the improved error
msgErrVecImproved = ['The relative error of the improved vectorization is ' num2str(errVecImproved) ' in ' num2str(timeVectorImproved) ' seconds.'];
disp(msgErrVecImproved);
msgErrVecImproved2 = ['The relative error of the improved vectorization is ' num2str(errVecImproved2) ' in ' num2str(timeVectorImproved2) ' seconds.'];
disp(msgErrVecImproved2);


%% improvement for Exercise 1c
% Parameters
n = 4;
nValues = linspace(0,4,5);

% computing the exact values
Iex = zeros(0,n+1);
Iex(1) = log(11/10);
Iex(2) = 1+10*(log(10)-log(11));
Iex(3) = -19/2 + 100*log(11) - 50*log(100);
Iex(4) = 286/3 + 1000*(log(10)-log(11));
Iex(5) = -11437/12 - 10000*(log(10)-log(11));

% computing the integrated values
In = zeros(0,n+1);
In(1) = log(11/10);

for k=2:5
    In(k) =1./k-10.*In(k-1);
end

% improvement: backwards iteration (unfortunately not shown in exercise session...)

% computing the absolute error
absErrors = abs(In-Iex);
