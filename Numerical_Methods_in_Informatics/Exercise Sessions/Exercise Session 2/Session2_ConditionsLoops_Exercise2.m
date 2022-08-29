%% Computing the sum of the squared integers until 1000
s=0;
for k=1:1000
    s=s+k^2;
end

%% Computing the factorial of 100
p=1;
k=1;
while k<=100
    p=p*k;
    k=k+1;
end

%% Compare the result of the previous loop with the factorial function of matlab
disp(p)
factorial(100) 

%% Compute the sum of ood and even integers in one loop
for k=1:2:100
    odd  = odd + k;
    even = even + (k+1);
end
disp(" sum of odds", odd)
disp("sum of evens", even)

