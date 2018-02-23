function X = gaussMultipleSystems( A,B )
%   Gaussian elimination method for solving multiple system of equations i.e. AX = B
%   Using forward elimination and back substitution, with partial pivoting 

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    error(strcat('Matrix is not solvable'))
end

[n,m] = size(B);
Y = zeros(n,m);
M = zeros(size(A));

for i = 1:m
    [M,Y(:,i)] = forwardEliminationWithPivoting(A,B(:,i));
end

X = zeros(n,m);
for i = 1:m
    X(:,i) = backSubstitution(M, Y(:,i));
end


end


