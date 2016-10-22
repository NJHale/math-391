function [ y ] = numericIntegralBkw( n )
%numericIntegralBkw A backward numeric integral approximation
    y = 1 / (5 * (n + 1));
    
    for i = n - 1 : 1
        y = (-i * y + 1) / (5 * i);
    end

end


