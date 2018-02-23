function [X,y] = backElimination(A,b)
%   "Back" elimination method, takes a Matrix and vector
%   Puts Matrix A in upper, reverse triangular form

if ~isSolvable(A)                                 % check is matrix is square and non-singular
    error(strcat('Matrix is not solvable'))
end

n = length(A);
entry = 0;
for i = n:-1:2                                    % for each row
    entry = entry + 1;
    for j = (i-1):-1:1                                 % row above
        if A(i,i) == 0
            error('Naive Gaussian does not support pivoting. Unable to solve;');
        else factor = A(j,i) / A(i,i);                  % find the factor
        end
        for k = entry:n                           % finish rest of entries in row
            A(j,k)=A(j,k)-(factor*A(i,k));             % set entry in A
        end
        b(j) = b(j) - ( factor .* b(i));               % set entry in b

    end
X = A;                                            % Output assignments
y = b;
end



