A = [5 -12 3; -3 9 1; 2 -1 -7];
b = [-1; 2; 3];
x0 = b;
tol = 0.0001;
nmax=10000;
spectralRadii = zeros(1,200);
omegas = zeros(1,200);
count = 1;
minEig = 100;
idx = 1;

% sparate A in D,L and R
D = diag(diag(A));
L = tril(A,-1);
R = triu(A,1);

%compute the set of spectral radii
for omega=0.01:0.01:2
    omegas(count)=omega;
    M = (-1).*inv(D+omega*L)*(omega*R+(omega-1)*D);
    spectralRadii(count) = max(abs(eig(M)));
    if max(abs(eig(M)))<minEig
        minEig = max(abs(eig(M)));
        idx = count;
    end
    count = count+1;
end

%plot
plot(omegas,spectralRadii);
hold on;
scatter(omegas(idx),spectralRadii(idx),'linewidth', 2, 'MarkerEdgeColor', 'r');
title('Relaxation Method');
xlabel('Omega');
ylabel('Spectral Radius');
xlim([0 2]);
ylim([abs(min(spectralRadii))-0.1 abs(max(spectralRadii))+0.1]);
legend({'Iteration Matrix vs. the Parameter Omega', 'Optimal Omega'}, 'Location', 'North');
savefig('relaxplot');

% compute the solution of the given linear system using the relaxation
% method with the optimal Omega
[x,iter] = relaxmeth(A,b,x0,nmax,tol,omegas(idx));
solution = x(:,iter);
disp('The solution of the given linear system is (by using the relaxation method):');
disp(solution);