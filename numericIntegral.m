function [ y ] = numericIntegral( n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    y = log(6/5);
    
    for i = 1 : n
        y = (1/i) - 5 * y;
    end

end

