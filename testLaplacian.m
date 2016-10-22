
%yerr = zeros(8, 1);
n = 4;
%for n = 4 : 4 : 32
    disp(n);
    width = 1;
    length = 1;

    syms x y;
    uBound = @(x, y) 1;
    dBound = @(x, y) 1 - x;
    lBound = @(x, y) 1;
    rBound = @(x, y) y;
    
    % define each axis for plotting
    xAxis = linspace(0, 1, n);
    yAxis = linspace(0, 1, n);
    
    % instantiate error arrays
    jacErr = zeros(n, 2);
    gauErr = zeros(n, 2);
    
    % instantiate iteration arrays
    jacs = zeros(n, 2);
    gaus = zeros(n, 2);
    
    max = 10000;
    tol = .0001;
    
    % calculate the A and b from centered difference scheme with the
    % given boundary conditions
    
    h = 1;
    for n = 10 : 5 : 25
        % store the tolerance for this trial
        %jacErr(h, 1) = tol / h;
        %gauErr(h, 1) = tol / h;
        jacs(h, 1) = n;
        gaus(h, 1) = n;
        
        [ A, b ] = centeredVariableLaplacian(uBound, dBound, lBound, rBound, x, y, width, length, n);
        
        [ jacX, jaxIts ] = jacobi(A, b, tol, max); fprintf('jaxIts: %i\n', jaxIts);
        [ gauX, gauIts ] = gaussSeidel(A, b, tol, max); fprintf('gauIts: %i\n', gauIts);
        jacs(h, 2) = jaxIts;
        gaus(h, 2) = gauIts;
        
        actX = A \ b;

        % reconsitute solution vectors into n x n topology matrices
        jacT = zeros(n);
        gauT = zeros(n);
        actT = zeros(n);

        k = 1;% solution vector index
        for i = 1 : n
            for j = 1 : n
                jacT(i, j) = jacX(k);
                gauT(i, j) = gauX(k);
                actT(i, j) = actX(k);
                k = k + 1;
            end
        end
        
        h = h + 1;
        %figure(1);
        %imagesc(xAxis, yAxis, jacT);
        %colorbar;
        
        %figure(2);
        %imagesc(xAxis, yAxis, gauT);
        %colorbar;

        %jacErr(h, 2) = norm(actT - jacT); fprintf('jacErr: %d\n', jacErr(h, 2));
        %gauErr(h, 2) = norm(actT - gauT); fprintf('gauErr: %d\n', gauErr(h, 2));
    end
    
    disp(jacs);
    plot(jacs(:, 1), jacs(:, 2), 'r');
    hold on;
    plot(gaus(:, 1), gaus(:, 2), 'b');
    
    
    
    
    
    %disp(T);
    %surf(T);
    %figure(n);
    %imagesc(x, y, T);
    %subplot(2,1,1, 'align'), imagesc(x, y, T);
    %colorbar;
    %A = zeros(n);
    %for i = 1 : n
    %    cy = (n - i) * (1/n);
    %    for j = 1 : n;
    %        cx = j * (1/n);
    %        A(i, j) = 1 - cx + cx * cy + (1/2)*sin(pi*cx)*sin(pi*cy);
    %    end
    %end
    %err = norm(A - T) / norm(A);
    %yerr(k, 1) = err;
    %k = k + 1;
    %disp(err);
    %subplot(2, 1, 2, 'align'), imagesc(x, y, A);
    %colorbar;
%end
%disp(yerr);

%plot(4 : 4 : 32, yerr, 'r');