conditionNumbers = zeros(100,5);
xValues = zeros(100,1);

for i = 1:100
    epsilon = i*0.5/100;
    A = [epsilon 1; 1 1];
    [L, U] = lu_nopivoting(A);
    [Q, R] = qr(A);
    conditionNumbers(i,1) = cond(A,Inf);
    conditionNumbers(i,2) = cond(Q,Inf);
    conditionNumbers(i,3) = cond(R,Inf);
    conditionNumbers(i,4) = cond(L,Inf);
    conditionNumbers(i,5) = cond(U,Inf);
    xValues(i) = epsilon;
end

%Plot
plot(xValues, conditionNumbers(:,1));
hold on;
plot(xValues, conditionNumbers(:,2));
plot(xValues, conditionNumbers(:,3));
plot(xValues, conditionNumbers(:,4));
plot(xValues, conditionNumbers(:,5));
legend({'Condition Numbers of A', 'Condition Numbers of Q', 'Condition Numbers of R', 'Condition Numbers of L', 'Condition Numbers of U'},'Location','northeast')
title('Condition Numbers of A,Q,R,L and U with Alternating Epsilon');
xlabel('0.005 < n < 0.5');
ylabel('Condition Number');
xlim([-0.01 0.52]);
ylim([-0.1*10^4 4.1*10^4]);
savefig('ex_condition');
hold off;