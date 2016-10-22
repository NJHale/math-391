function [ tri ] = tridiagonal( l, d, r, n )
%tridiagonal generates an n x n tridiagonal matrix with l -> left of diag,
%d -> diag, r -> right of diag
    tri = zeros(n, n);
    
    for i = 1 : n
        if (i - 1 > 0)
            tri(i, i - 1) = l;
        end
        if (i + 1 <= n)
            tri(i, i + 1) = r;
        end
        tri(i, i) = d;
    end
end

