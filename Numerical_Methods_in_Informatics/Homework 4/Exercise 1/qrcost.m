 %% Clearing Envrionment
clear all;
close all;
clc;

%% Initialization
% Parameters
n = [200 400 800 1600 3200];
decompTime = zeros(1, length(n));
solutionTime = zeros(1, length(n));

% QR decomposition and solution for all ns
for i=1:length(n)
    fprintf("Running for n=%d\n", n(i));
    [A,b] = deliverAandb(n(i));
    tic;
    [Q,R] = qrsolve(A);
    decompTime(i) = toc;
    fprintf("QR time is: %8.5f\n", decompTime(i));
    x = R\(Q'*b);
    solutionTime(i) = toc;
    fprintf("System time is: %8.5f\n\n", solutionTime(i));
end

%% Theoretical Complexities
%theoretical complexities (4n^3)/3 and (4n^3)/3+n, approximation with
%constant c
complexity = mean(decompTime(3:end)/n(3:end).^3);


%% Plotting
%plot
loglog(n,decompTime,'-o');
hold on;
loglog(n,solutionTime,'-o');
loglog(n,complexity*n.^3, '--o');
xlabel('n');
ylabel('Time [s]');
title('Computational Cost of QR decomposition');
legend({'Decomposition Time', 'Total Solution Time', 'Theoretical Complexitiy of the Decomposition O(n^3)'},'Location','northwest')
savefig('qr_cost.fig');
hold off;

%% Function to compute A and b for different ns
function[A,b] = deliverAandb(n)
    % Parameters
    A = zeros(n,n);
    b = zeros(n,1);
    
    % compute A
    for i=1:n
        for j=1:n
            if i == j
                A(i,j) = n;
            else
                A(i,j) = exp((-1)*abs(i-j)/n);
            end
        end
    end
    
    % compute b
    for i=1:n
        if mod(i,2) == 1
            b(i) = 1;
        else
            b(i) = 0;
        end
    end
end
