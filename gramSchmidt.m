function [ O ] = gramSchmidt( A )
%GRAMSCHMIDT Returns the Orthonormal Basis of matrix A
    %Get the dimensions of A
    dims = size(A);
    numRow = dims(1);
    numCol = dims(2);
    
    %Define a transition matrix
    O = zeros(dims(1), dims(2));
    
    %Transverse the column vectors
    for i = 1 : numCol
        %Find the Norm of the column vector
        colNorm = 0;
        for j = 1 : numRow
            colNorm = colNorm + (A(j, i))^2;
        end
        %Take the square-root of the sum of squares (Euclidean Norm)
        colNorm = (colNorm)^(1/2);
        %Normalize the column
        for j = 1 : numRow
            A(j, i) = A(j, i) / colNorm;
        end
        %Now subtract the projection of the normallized column onto every
        %other column vector
        for j = i + 1 : numCol
            %Find the elemental projection multiplier of two vectors
            proj = 0;
            for k = 1 : numRow
                proj = proj + A(k, i) * A(k, j)
            end
            proj = proj / (colNorm)^2;
            %Subtract the projection from the column elements of the
            %new vector
            for k = 1 : numRow
                A(k, j) = A(k, j) - proj * A(k, j);
            end
        end
    end
    
    O = A 

end

