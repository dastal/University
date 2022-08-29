% clear
clear all;
close all;
clc;

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

% computing the absolute error
absErrors = abs(In-Iex);

% plot instabilities error
plot(nValues, absErrors);
hold on;
xlabel("n");
ylabel("Absolute Error")
title("Instabilities Error");
savefig("InstabilitiesError.fig");
close;

% plot with semilogy scale
semilogy(nValues, absErrors);
hold on;
xlabel("n");
ylabel("Absolute Error")
title("Instabilities Error with Semilogy Scale");
savefig("InstabilitiesErrorSemilogy.fig");
close;
