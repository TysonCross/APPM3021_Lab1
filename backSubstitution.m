function x = backSubstitution(A,b)
%   Solves for variables and substitutes them (upwards from the bottom)
%   in a upper triangular matrix (forward eliminated system of equations)


% if ~isSolvable(A)                                   % check is matrix is square and non-singular
%     error(strcat('Matrix is not solvable'))
% end

n = length(b);
x = zeros(n,1);                                     % initialise solution vector
if A(n,n) == 0
    error('Divide by zero: unable to solve.');
    else x(n) = b(n) / A(n,n);                      % solution to variable in bottom row
end

for i = (n-1):-1:1                                  % work ascending from the last row up
    value = b(i);                                   % find the factor
    for j = (i+1):n                                 % finish rest of entries in row
        value = value -(A(i,j) .* x(j));        
    end
    if A(i,i) ~= 0
        x(i) = value / A(i,i);                      % solve for variable
    end
end
