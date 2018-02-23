function [X,y] = forwardElimination(A,b)
%   Forward elimination method, takes a Matrix and vector
%   Puts Matrix A in upper triangular form

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    error(strcat('Matrix is not solvable'))
end

n = length(b);
for row = 1:(n-1)                                   % for each row
    for i = (row+1):n                               % for each pivot along the main diagonal
        if A(row,row) ~= 0
            m = A(i,row) / A(row/row);              % find the factor
            else m = 1;
        end
        for j = row:n                               % finish rest of entries in row
            A(i,j)=A(i,j)-(m*A(row,j));             % set entry in A
        end
        b(i) = b(i) - ( m .* b(row));               % set entry in b

    end
X = A;                                              % Output assignments
y = b;
end
