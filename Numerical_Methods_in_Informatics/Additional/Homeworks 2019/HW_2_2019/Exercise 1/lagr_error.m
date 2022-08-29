% clear
clear all;
close all;
clc;

% Derivations
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
    index = index + 1;
end
[max2, ind] = max(yValues);

%print the answer on screen
epsilonAnswer = ['Epsilon: ' num2str(max1)];
disp(epsilonAnswer);
errorAnswer = ['The Error Range is: [0 ' num2str(max2, '%.4f') ']'];
disp(errorAnswer);