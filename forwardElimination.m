function [X,y] = forwardElimination(A,b)
%   Forward elimination method, takes a Matrix and vector
%   Puts Matrix A in upper triangular form

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    error(strcat('Matrix is not solvable'))
end

n = length(A);
for i = 1:(n-1)                                     % for each row
    for j = (i+1):n                                 % the next row (below)
        if A(i,i) == 0
            error('Naive Gaussian does not support pivoting. Unable to solve;');
        else factor = A(j,i) / A(i,i);              % find the factor
        end

        for k = i:n                                 % finish rest of entries in row
            A(j,k)=A(j,k)-(factor*A(i,k));          % set entry in A
        end
         b(j) = b(j) - ( factor .* b(i));           % set entry in b
    end
end
X = A;                                              % Output assignments
y = b;
end
