function [ Q, R ] = gramSchmidtQR( A )
%gramSchmidtQR Performs a modified Gram-Schmidt algorithm for the QR
%factorization of A
%   Computes the QR factorization of A in which, at the kth step, the kth
%   column, and the kth row of R are computed
    % get the dimensions of A
    [m, n] = size(A);
    %initialize Q and R
    Q = zeros(m, n);
    R = zeros(n);

    for k = 1 : n
        
        R(k, k) = norm( A(:, k) );
        
        Q(:, k) = A(:, k) / R(k, k);
        
        R(k, k+1 : n) = Q(:, k)' * A(:, k+1 : n);
        
        A(:, k+1 : n) = A(:, k+1 : n) - Q(:, k) * R(k, k+1 : n);
    end
    
end

