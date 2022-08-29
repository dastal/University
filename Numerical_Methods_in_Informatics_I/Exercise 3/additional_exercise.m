% Matrix A lines
% Transistor 
% Resistor 
% Computer_Chip

% Matrix A lines
% Copper Zinc Glass

A = [6 6 2; 2 3 1; 4 5 5];
% a and b see additional sheet of Homework 3

% c)
[L, U] = lu_nopivoting(A);
% det(A) = det(U)
det_U = det(U);
answ = ['The determinant of A calculated with U (because det(A) = det(U)) is: ' num2str(det_U)];
disp(answ);
newLine = " ";
disp(newLine);

c1 = [210; 95; 235];
c2 = [220; 105; 190];

x1 = linsolve(A,c1);
x2 = linsolve(A,c2);

answ1 = ['With 210 units of copper, 95 units of zinc, and 235 units of glass, ' num2str(x1(1)) ' tansistors, ' num2str(x1(2)) ' resistors and ' num2str(x1(3)) ' computer chips can be produced.'];
disp(answ1);

answ2 = ['With 220 units of copper, 105 units of zinc, and 190 units of glass, ' num2str(x2(1)) ' tansistors, ' num2str(x2(2)) ' resistors and ' num2str(x2(3)) ' computer chips can be produced.'];
disp(answ2);