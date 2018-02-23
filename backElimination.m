function [X,y] = backElimination(A,b)
%   "Back" elimination method, takes a Matrix and vector
%   Puts Matrix A in upper, reverse triangular form

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    error(strcat('Matrix is not solvable'))
end

n = length(b);
for row = n:-1:2                                   % for each row
    for i = n:-1:(row+1)                            % for each pivot along the main diagonal
        if A(row,row) ~= 0
            m = A(i,row) / A(row/row);              % find the factor
        end
        for j = n:-1:row                            % finish rest of entries in row
            A(i,j)=A(i,j)-(m*A(row,j));             % set entry in A
        end
        b(i) = b(i) - ( m .* b(row));               % set entry in b

    end
X = A;                                              % Output assignments
y = b;
end
