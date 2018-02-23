function [X,y] = forwardEliminationWithPivoting(A,b)
%   Forward elimination method, takes a Matrix and vector
%   Uses partial pivoting
%   Puts Matrix A in upper triangular form

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    error(strcat('Matrix is not solvable'))
end

n = length(b);
for i = 1:(n-1)                                   % for each row
    for p = (i+1):n                               % check for need to do partial-pivoting
        if (A(i,i)<A(p,i))                        % pivot is smaller than current entry
            A = swapRow(A,i,p);                   % swap rows in A
            b = swapRow(b,i,p);                   % swap row in b
        end
    end
    for j = (i+1):n                               % for each pivot along the main diagonal
        if A(i,i) == 0
            error('Divide by zero. Unable to solve;');
        else m = A(j,i) / A(i,i);                 % find the factor
        end

        for k = i:n                               % finish rest of entries in row
            A(j,k)=A(j,k)-(m*A(i,k));             % set entry in A
        end
        b(j) = b(j) - ( m .* b(i));               % set entry in b
    end
end
X = A;                                              % Output assignments
y = b;
end
