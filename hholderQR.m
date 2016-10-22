function [Q, R] = hholderQR(A)
%
%    This function computes the QR factorization of a general real matrix
%  A by Householder reflections.
%
%  Copyright 1996 by Carlos F. Borges. All rights reserved.


% Get the size of the matrix and set the number of steps.

[n m] = size(A);
if (m < n)
  steps = m;
else
  steps = n-1;
end

% Copy A to the working matrix R, and initialize Q.

R = A;
Q = eye(n);

% The main loop that reduces column by column.

for j = 1 : steps
      % Compute the Householder vector for the current column with get_house.
      x = R(:, j);%get_house(R(:,j),j,n);
      v = x;
      % Compute the proper Householder vector.
      v(j) = v(j) + sign(x(j)) * norm(x(j:n));
      % Normalize the result so that H = I - v*v'. Includes an error check for 
      % the trivial reflection.
      if ((v'*v) > 0)
          v = v*sqrt(2/(v'*v));
      end

    % Normalize the result so that H = I - v*v'. Includes an error check for 
    % the trivial reflection.

    if ((v'*v) > 0)
      v = v*sqrt(2/(v'*v));
    end


      % Apply the transformation, that is compute R = H*R.
      R = R - v*(v'*R);

      % Force zeros in the places that should be zero but for rounding error.
      for i=j+1:n
        R(i,j) = 0;
      end

  % Apply the Householder reflection to Q from the right, Q = Q*H'.
  Q = Q - (Q*v)*v';

end
