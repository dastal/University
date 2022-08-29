% clear
clear all;
close all;
clc;

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

% computing the relative errors of resL and resV
errVec =  abs(exactValue - resV)./exactValue;
errLoop = abs(exactValue - resL)./exactValue;

% displaying errors
msgErrVec = ['The relative error of the vectorization is ' num2str(errVec) ' in ' num2str(timeVector) ' seconds.'];
disp(msgErrVec);
msgErrLoop = ['The relative error of the loop is ' num2str(errLoop) ' in ' num2str(timeLoop) ' seconds.'];
disp(msgErrLoop);
