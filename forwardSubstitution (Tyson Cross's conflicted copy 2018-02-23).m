function x = forwardSubstitution(A,b)
%   Solves for variables and substitutes them (downwards from the top)
%   in a upper triangular matrix (forward eliminated system of equations)
 
if ~isSolvable(A)                                   % check is matrix is square and non-singular
    error(strcat('Matrix is not solvable'))
end
 
n = length(b);
x = zeros(n,1);                                     % initialise solution vector
x(1) = b(1) / A(1,1);                               % solution to variable in top row
for i = 2:n                                         % work ascending from the second row down
    value = b(i);                                   % find the factor
    for j = (i+1):n                                 % finish rest of entries in row
        value = value - (A(i,j) .* x(j));        
    end
    x(i) = value / A(i,i);                          % solve for variable
end
