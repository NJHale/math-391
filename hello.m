%Instantiate square matrix A


A = [1, 2; 2, 3; 4, 5]

disp(A);
disp(B);

%Test matrix operations

%Test left multiply
C = A * B;
%Test right multiply
D = B * A;
%Test if A is invertable
I = A * (1 / A);

disp(C);
disp(D);
disp(I);