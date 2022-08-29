A1 = [11 10 14; 12 11 -13; 14 13 -66];
A2 = [11 10 14; 12 11.01 -13; 14 13 -66];
b1 = [1; 1; 1];
b2 = [1.01; 1.01; 1.01];


%solving the first equaiton
[L1, U1] = lu_nopivoting(A1);
A11 = L1*U1;
x1 = linsolve(A11,b1);
disp(x1);

%solving the second equation
[L2, U2] = lu_nopivoting(A2);
A22 = L2*U2;
x2 = linsolve(A22,b1);
disp(x2);

%solving the third equation
A33 = L1*U1;
x3 = linsolve(A33,b2);
disp(x3);

%Explanation:
%