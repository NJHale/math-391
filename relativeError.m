function [ err ] = relativeError( a, b )
%relativeError calculates the relative error of 
% b on a
    err = abs(a - b) / abs(a);
end

