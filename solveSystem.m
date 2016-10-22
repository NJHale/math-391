function [ x ] = solveSystem( n, L, b )
%solveSystem Solves the given system of n x n lower triangular matrix A and m x 1 vector b
    %instantiate the solution vector
    x = zeros(n, 1);
    %declare the initial value
    x(1) = b(1) / L(1, 1);
    
    %iterate over the space
    for i = 2 : n
        %calculate inner sum
        isum = 0;
        for j = 1 : i - 1
            isum = isum + L(i, j) * x(j);
        end
        
        x(i) = (1 / L(i, i)) * (b(i) - isum);
    end
    
    
end

