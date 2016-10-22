function [ A, b ] = centeredVariableLaplacian( uBound, dBound, lBound, rBound, x, y, width, length, n )
    %create an n^2 x n^2 coefficient matrix
    A = zeros(n * n);
    %create a solution vector
    b = zeros(n * n, 1);
    
   
    for i = 1 : n
        cy = (n - i) * (length / n);
        for j = 1 : n
            cx = j * (width / n);
            if (b((i - 1) * n + j) == 0) %initilize b vector element if zero
                b((i - 1) * n + j) = -(pi^2) * sin(pi * cx) * sin(pi * cy) * (1/n)^2;
            end
            
            %check boundary conditions
            %downward boundary condition
            if (i + 1 > n)
                %correct index and apply boundary value to b
                b((i - 1) * n + j) = b((i - 1) * n + j) - dBound(cx, cy);
            end
            %upward boundary
            if (i - 1 < 1)
                %correct index and apply boundary value to b
                b((i - 1) * n + j) = b((i - 1) * n + j) - uBound(cx, cy);
            end
            %right boundary
            if (j + 1 > n) 
                %correct index and apply boundary value to b
                b((i - 1) * n + j) = b((i - 1) * n + j) - rBound(cx, cy);
            end
            %left boundary
            if (j - 1 < 1)
                %correct index and apply boundary value to b
                b((i - 1) * n + j) = b((i - 1) * n + j) - lBound(cx, cy);
            end
            
            %get reindexed row/col of coefficient matrix A
            row = (i - 1) * n + j; 
            %Add each non-boundary part of the linear system to A
            %-4 * T(i,j)
            col = row;
            A(row, col) = -4;
            %1 * T(i+1,j)
            col = i * n + j;
            if (i + 1 <= n)
                A(row, col) = A(row, col) + 1;
            end
            %1 * T(i-1,j)
            col = (i - 2) * n + j;
            if (i - 1 >= 1)
                A(row, col) = A(row, col) + 1;
            end
            %1 * T(i,j+1)
            col = (i - 1) * n + (j + 1);
            if (j + 1 <= n)
                A(row, col) = A(row, col) + 1;
            end
            %1 * T(i,j-1)
            col = (i - 1) * n + (j - 1);
            if (j - 1 >= 1)
                A(row, col) = A(row, col) + 1;
            end
                 
        end
    end
    %disp(A);
    %disp(b);
    %x = A \ b;
    %x = jacobi(A, b, .0001, 10000);
    %x = gaussSeidel(A, b, .0001, 10000);
    %reconsitute solution vector into an n x n topology matrix
    %T = zeros(n);%topology matrix
    %k = 1;%solution vector index
    %for i = 1 : n
    %    for j = 1 : n
    %        T(i, j) = x(k);
    %        k = k + 1;
    %    end
    %end
end

