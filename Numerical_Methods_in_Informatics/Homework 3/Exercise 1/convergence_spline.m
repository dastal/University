%% Clearing environment
clear all;
close all;
clc;

%% Parameters

% Function definition
f = @(x) x.*cos(x)-(x-2).^2-1;

% Defining the h to consider
hh = [0.5, 0.25, 0.125];

% Testing vector to consider
x0 = 0;
xn = 5;
xtest = linspace(x0, xn, 100);

%% Computing the spline with the hands vector to get the error wrt h

% looping on the desired h to consider
for k = 1:length(hh)
    
    % Getting the desired h
    h = hh(k);
    
    % Creating the nodes
    xx = x0+h.*(0:(xn-x0)/h);
    
    % Getting the interpolation coefficients from the nodes
    coeff = naturalspline(xx', f(xx));
    
    % Evaluate the points values depending on in which interval they lie
    ytest = [];
    for inter = 1:(length(xx)-1)
       
        % Retrieving the points living in the interval inter-1
        index = find((xx(inter+1)>=xtest).*(xx(inter)<=xtest));
        
        %Tabulating the Values
        xtemp = xtest(index)-xx(inter);
        
        % Constructing the determination matrix an retrieving the
        % interpolated values
        A = [xtemp.^3; xtemp.^2; xtemp; ones(1, length(index))];
        values = coeff(inter,:)*A;
        
        % Reconstructing the values within this interval
        ytest = [ytest, values];
    end
    
    % Compute the 2norm of the error
    err(k) = norm(ytest-f(xtest),2);
end

%% Plot the error
loglog(hh, err,"--*");
hold on;
xlabel("log(h)");
ylabel("log(err)");
title("Error against interval size");
legend("Error");
savefig("PlotErrorSplines.fig");
hold off;
close;

polyfit(log(hh),log(err),1);
