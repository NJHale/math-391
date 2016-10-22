%n = 5; a = 1*ones(n,1); b = -2*ones(n,1); c = 1*ones(n,1);
%f = ones(n, 1);
%x = solveTriDiag(a,b,c,f,n);

%A = tridiagonal(1, -2, 1, n);
%disp(A);
%disp(x);
%u = A \ f;
%disp(u);
%disp(abs((norm(u) - norm(x)) / norm(u)));


%Discretization parameter
N = 1000;
matlabErr = zeros(N, 1);
y = zeros(N, 1);
for n = 1 : N
    A = tridiagonal(1, -2, 1, n);
    h = 1 / n;
    A = A .* (1 / h^2);

    mb = A \ approxODE(0, 1, 1, -1, n);
    x = transpose(linspace(0, 1, n));
    u = cos(pi .* x);

    matlabErr(n) = abs((norm(u) - norm(mb)) / norm(u));
    y(n) = n;
end

myErr = zeros(N, 1);

for n = 1 : N
    a = 1*ones(n,1); b = -2*ones(n,1); c = 1*ones(n,1);
    h = 1 / n;
    a = a .* (1 / h^2); b = b .* (1 / h^2); c = c .* (1 / h^2);

    mb = solveTriDiag(a, b, c, approxODE(0, 1, 1, -1, n), n);
    x = transpose(linspace(0, 1, n));
    u = cos(pi .* x);

    myErr(n) = abs((norm(u) - norm(mb)) / norm(u));
end

plot(y, matlabErr, 'red x');
hold all;
plot(y, myErr, 'blue');

myErr

%disp(mb);
%plot(x, mb, 'red');
%hold on;
%plot(x, cos(pi * x), 'blue');
