function x = gaussElimination(A,b)
%   Gaussian elimination method for solving a single system of equations i.e. Ax = b
%   Using back elimination and forward substitution, without partial pivoting
%   This function returns the front, top triangular values as 0

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    error(strcat('Matrix is not solvable'))
end

[M,y] = backElimination(A,b)
x = forwardSubstitution(M, y)

end