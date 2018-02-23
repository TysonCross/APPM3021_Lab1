function [L,U] = LUFactorization(A)
%   Permuted LU-factorization splits a matrix into Upper and Lower matrices
%   using Doolitle Decomposition
 
if ~isSolvable(A)                                       % check is matrix is square and non-singular
    error(strcat('Matrix is not solvable'))
end
 
n = length(A);
 
L = eye(n);                                             % L diagonal entries will be 1 
U = zeros(n);                                           % pre-allocate upper matrix U
 
for i = 1:n                                             % Loop through from second row
        % Lower matrix calculation
        for j = 1:(i-1)                                 % Loop through columns
            L(i,j) = A(i,j);                            % Use current A(i,j) value
            for k = 1:(j-1)                             % for each entry (lower ?)
                L(i,j)=L(i,j)-double(L(i,k)*U(k,j));    % double maintains precision of inner product
            end
            if U(j,j) ~= 0
                L(i,j)= L(i,j)/U(j,j);                  % completes the entry's calculation equation
            end
        end
 
        % Upper matrix calculation
        for j = i:n                                     % Loop through columns
            U(i,j) = A(i,j);                            % Use current A(i,j) value
            for k = 1:(i-1)                             % for each entry in the row & column
                U(i,j)=U(i,j)-(double(L(i,k)*U(k,j)));  % assign entry (upper ?)
            end
        end
end
end