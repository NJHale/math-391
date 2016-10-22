function [ x, its ] = jacobi(A, b, tol, max)
%jacobi - performs the jacobi iteration for finding the x^kth approximation
%of solution vector x for x = Bx + d
    n = length(b);
    x = zeros(n, 1);
    % generate new approx. until convergence or max iteration met
    for k = 1 : max
        nextX = zeros(n, 1);
        % generate k + 1 approx
        for i = 1 : n
            sum = 0;
            for j = 1 : n
                if j ~= i
                    sum = sum + A(i, j) * x(j);
                end
            end
            nextX(i) = (1 / A(i, i)) * (b(i) - sum);
        end
        % calculate difference between successive approximations
        conv = norm(nextX - x); %disp(conv);
        % set x
        x = nextX;
        its = k;
        % check convergence
        if conv < tol
            break;
        end 
    end
end