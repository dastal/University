f = @(x) pi.*x.*sin(pi.*x.^2);
secondDer = @(x) pi*(6*pi*x*cos(pi*x^2)-4*pi^2*x^3*sin(pi*x^2));
fourthDer = @(x) 4*pi^3*x*((4*pi^2*x^4-15)*sin(pi*x^2)-20*pi*x^2*cos(pi*x^2));
compSimp = zeros(8,1);
compTrap = zeros(8,1);
convRateSimp = zeros(8,1);
convRateTrap = zeros(8,1);
x = linspace(1,8,8);

%Compute Iex analytically
Iex = integral(f,0,1);

%Compute the errors
for n=1:8
    compSimp(n) = simp_comp(f,2^n);
    compTrap(n) = trap_comp(f,2^n);
end

simpErrors = abs(compSimp-Iex);
trapErrors = abs(compTrap-Iex);

%compute the Theoretical Convergence Rates
for i=1:8
    epsilonSimp = 1/(2^(1.15*i^1.05+2.15));
    epsilonTrap = 1/((-1)*2^(i*2+1.8));
    convRateSimp(i) = -1/16*1^5/180*fourthDer(epsilonSimp);
    convRateTrap(i) = (-1)*1^3/12*secondDer(epsilonTrap);
end

%Plot
semilogy(x,simpErrors);
hold on;
semilogy(x, convRateSimp);
semilogy(x, trapErrors);
semilogy(x, convRateTrap);
title('Errors');
xlabel('n');
ylabel('log(Error)');
xlim([1 8]);
ylim([10^(-11) 10^0]);
legend({'Composite Simpson', 'Expected Convergence Rate Simpson', 'Composite Trapezoidal', 'Expected Convergence Rate Trapezoidal'}, 'location', 'Southwest');
savefig('plot_quadr');