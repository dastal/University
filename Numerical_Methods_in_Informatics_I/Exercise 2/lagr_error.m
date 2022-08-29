% Exercise 1a
% I didn't know where I should put the script for 1a so I put it here
result = zeros(4,101);
xValues = (0:0.01:1);

for i=0:0.01:1
    index = int8(i*100+1);
    result(:,index) = lagr_polynomial(i);
    if index == 1
        [yValuesFor0, err0] = lagr_polynomial(i);
    elseif index == 61
        [yValuesFor06, err06] = lagr_polynomial(i);
    elseif index == 91
        [yValuesFor09, err09] = lagr_polynomial(i);
    end    
end

answer0 = [ 'The approximated value for x = 0 is: ' num2str(yValuesFor0(4,:), '%.4f') ];
disp(answer0);
answer06 = [ 'The approximated value for x = 0.6 is: ' num2str(yValuesFor06(4,:), '%.4f') ];
disp(answer06);
answer09 = [ 'The approximated value for x = 0.9 is: ' num2str(yValuesFor09(4,:), '%.4f') ];
disp(answer09);

erransw0 = [ 'The error for x = 0 is: ' num2str(err0, '%.4f') ];
disp(erransw0);
erransw06 = [ 'The error for x = 0.6 is: ' num2str(err06, '%.4f') ];
disp(erransw06);
erransw09 = [ 'The error for x = 0.9 is: ' num2str(err09, '%.4f') ];
disp(erransw09);

plot(xValues, result(1,:));
hold on;
plot(xValues, result(2,:));
plot(xValues, result(3,:));
scatter(0, result(1,1), 's', 'k');
scatter(0.6, result(1,61), 's', 'k');
scatter(0.9, result(1,91), 's', 'k');
title('3 Lagrangian Ploynomials with the starting Points x0, x1, x2');
xlabel('0 <= x <= 1');
ylabel('y = cos(x)');
xlim([0 1]);
ylim([-0.6 1.5]);
legend({'k = 0', 'k = 1', 'k = 2'},'Location','northwest')
savefig('lagrangianpoly.fig');
hold off;

% Exercise 1b
% f(x) = cos(x)
% f'(x) = -sin(x)
% f''(x) = -cos(x)
% f'''(x) = sin(x)
ffffun = @(x) cos(x);

%find the maximum epsilon
max1 = 0;
xValuesB = (0:0.001:1);
for i = 1:1001
    if ffffun(xValuesB(i))>max1
        max1 = ffffun(xValuesB(i));
    end
end
fact4 = factorial(3);

%compute the error range
yValues = (1001);
f = @(x) (max1/fact4) * x * (x-0.6) * (x-0.9);
index = 1;
for i = 0:0.001:1
    yValues(index) = f(i);
    disp(f(i));
    index = index + 1;
end
[max2, ind] = max(yValues);
disp(yValues);

%print the answer on screen
epsilonAnswer = ['Epsilon: ' num2str(max1)];
disp(epsilonAnswer);
errorAnswer = ['The Error Range is: [0 ' num2str(max2, '%.4f') ']'];
disp(errorAnswer);