function [ u ] = approxODE(a, b, ua, ub, n )
%approxODE approximates the centered difference of the given second
%derivative f
    %Coefficient Matrix for the centered difference
    %A = tridiagonal(1, -2, 1, n);
    %n = 5; l = 1*ones(n,1); m = 2*ones(n,1); r = 1*ones(n,1);
    
    f = @(r) -pi^2 * cos(pi * r);
    %Discretization difference
    h = 1 / n;
    
    %A = A .* (1 / h^2);
    
    x = transpose(linspace(a, b, n));
    y = zeros(n, 1);
    %Make corrections for first and last coefficients
    y(1) = f(x(1)) - ua / h^2;
    y(n) = f(x(n)) - ub / h^2;
    
    for i = 2 : n - 1
        y(i) = f(x(i));
    end
    %Return to be solved with either matlab or solveTriDiag.m
    u = y;
end

