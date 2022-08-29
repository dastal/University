%n = 250
n1 = 250;
A1 = zeros(n1,n1);
b1 = zeros(n1,1);
for i = 1:n1
    %modify b
    b = mod(i,2);
    if b == 1
        b1(i) = 1;
    else
        b1(i) = 0;
    end
    %modify A
    for j = 1:n1
        if j == i
            A1(i,j) = n1;
        else
            A1(i,j) = exp((-1)*abs(i-j)/n1);
        end
    end
end

%n = 500
n2 = 500;
A2 = zeros(n2,n2);
b2 = zeros(n2,1);
for i = 1:n2
    %modify b
    b = mod(i,2);
    if b == 1
        b2(i) = 1;
    else
        b2(i) = 0;
    end
    %modify A
    for j = 1:n2
        if j == i
            A2(i,j) = n2;
        else
            A2(i,j) = exp((-1)*abs(i-j)/n2);
        end
    end
end

%n = 1000
n3 = 1000;
A3 = zeros(n3,n3);
b3 = zeros(n3,1);
for i = 1:n3
    %modify b
    b = mod(i,2);
    if b == 1
        b3(i) = 1;
    else
        b3(i) = 0;
    end
    %modify A
    for j = 1:n3
        if j == i
            A3(i,j) = n3;
        else
            A3(i,j) = exp((-1)*abs(i-j)/n3);
        end
    end
end

%n = 2000
n4 = 2000;
A4 = zeros(n4,n4);
b4 = zeros(n4,1);
for i = 1:n4
    %modify b
    b = mod(i,2);
    if b == 1
        b4(i) = 1;
    else
        b4(i) = 0;
    end
    %modify A
    for j = 1:n4
        if j == i
            A4(i,j) = n4;
        else
            A4(i,j) = exp((-1)*abs(i-j)/n4);
        end
    end
end

%n = 4000
n5 = 4000;
A5 = zeros(n5,n5);
b5 = zeros(n5,1);
for i = 1:n5
    %modify b
    b = mod(i,2);
    if b == 1
        b5(i) = 1;
    else
        b5(i) = 0;
    end
    %modify A
    for j = 1:n5
        if j == i
            A5(i,j) = n5;
        else
            A5(i,j) = exp((-1)*abs(i-j)/n5);
        end
    end
end

%Storing the for values
xValues = [250 500 1000 2000 4000];

%time measurement of the decomposition
decompTime = zeros(1,5);
solutionTime = zeros(1,5);

tic
[Q1, R1] = qrsolve(A1);
decompTime(1) = toc;

tic
[Q2, R2] = qrsolve(A2);
decompTime(2) = toc;

tic
[Q3, R3] = qrsolve(A3);
decompTime(3) = toc;

tic
[Q4, R4] = qrsolve(A4);
decompTime(4) = toc;

tic
[Q5, R5] = qrsolve(A5);
decompTime(5) = toc;

%time measurement of the solution
tic
x1 = Q1 * R1 * b1;
solutionTime(1) = decompTime(1) + toc;

tic
x2 = Q2 * R2 * b2;
solutionTime(2) = decompTime(2) + toc;

tic
x3 = Q3 * R3 * b3;
solutionTime(3) = decompTime(3) + toc;

tic
x4 = Q4 * R4 * b4;
solutionTime(4) = decompTime(4) + toc;

tic
x5 = Q5 * R5 * b5;
solutionTime(5) = decompTime(5) + toc;

%theoretical complexities (4n^3)/3 and (4n^3)/3+n, approximation with
%constant c
decompComplexity = zeros(1,5);
totalComplexity = zeros(1,5);
for i = 1:5
    approxFlop = (4*xValues(i)^3)/3;
    c = approxFlop/decompTime(i);
    decompComplexity(i) = (4*xValues(i)^3)/3 /c;
    totalComplexity(i) = (xValues(i) + (4*xValues(i)^3)/3)/c;
end

%plot
scatter(xValues, decompTime);
hold on;
scatter(xValues, solutionTime);
plot(xValues,decompComplexity, ':');
plot(xValues,totalComplexity, ':');
xlabel('n');
ylabel('Time [s]');
xlim([-10 4010]);
ylim([-10 solutionTime(5)] + 10);
%title('Time Cost');
legend({'Decomposition Time', 'Total Solution Time', 'Theoretical Complexitiy for the Decomposition', 'Theoretical Complexity for the Total Solution'},'Location','northwest')
savefig('qr_cost.fig');
hold off;