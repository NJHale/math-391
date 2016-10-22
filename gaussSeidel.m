function [ x, its ] = gaussSeidel( A, b, tol, max )
%gaussSeidel - performs the Gauss-Seidel iterative method for finding an
%approximation for x = Bx + d
    n = length(b);
    % initialize the first approx. as all 0's 
    x = zeros(n, 1);
    % generate new approx until tol or max met
    for k = 1 : max
        % instantiate the k+1th vector
        nextX = zeros(n, 1);
        % generate the k+1th approx
        for i = 1 : n
            sum = 0;
            for j = 1 : n
                % use all available k+1th terms
                if j < i
                    sum = sum + A(i, j) * nextX(j);
                elseif j > i
                % none available - use the rest of the kth terms
                    sum = sum + A(i, j) * x(j);
                end
            end
            nextX(i) = (1 / A(i, i)) * (b(i) - sum);
        end
        % calculate the difference between successive approximations
        conv = norm(nextX - x); %disp(conv);
        % set x to nextX
        x = nextX;
        its = k;
        % check convergence
        if conv < tol
            break;
        end
        
    end


end

