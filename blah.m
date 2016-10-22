    n = 50000;
    
    A = tridiagonal(1, -2, 1, n);
    h = 1 / n;
    A = A .* (1 / h^2);

    mb = A \ approxODE(0, 1, 1, -1, n);
    x = transpose(linspace(0, 1, n));
    u = cos(pi .* x);

    relErr = abs((norm(u) - norm(mb)) / norm(u));
    
    
    disp (relErr);