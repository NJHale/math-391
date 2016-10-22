n = 5;

A = rand(n, n);
b = rand(n, 1);

y = solveSystem(n, A, b);

disp('Matrix A:'); disp(A);

disp('Vector b:'); disp(b);

disp('Solution:'); disp(y);




