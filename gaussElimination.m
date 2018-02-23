function x = gaussElimination(A,b)
%   Gaussian elimination method for solving a single system of equations i.e. Ax = b
%   Using forward elimination and back substitution, without partial pivoting 

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    error(strcat('Matrix is not solvable'))
end

[M,y] = forwardElimination(A,b);
x = backSubstitution(M, y);

end