function [L,U] = LUFactorization(A)
% Tyson Cross
% Student 1239448
% APPM3021 
%
%   Permuted LU-factorization splits a matrix into Upper and Lower matrices
%   https://vismor.com/documents/network_analysis/matrix_algorithms/S4.SS2.php

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    error(strcat('Matrix is not solvable'))
end

n = length(A);

L = eye(n);                                         % Lower diagonal entries will be 1 
U = zeros(n);                                       % pre-allocate upper matrix (Doolitle Decomposition)

for i = 1:n                                         % Loop through from second row
        % Lower matrix calculation
        for j = 1:(i-1)                             % Loop through columns
            L(i,j) = A(i,j);
            for k = 1:(j-1)
                L(i,j) = L(i,j) - ( L(i,k)*U(k,j) );
            end
            L(i,j)= L(i,j)/U(j,j);
        end

        % Upper matrix calculation
        for j = i:n
            U(i,j) = A(i,j);
            for k = 1:(i-1)
                U(i,j) = U(i,j) - ( L(i,k)*U(k,j) );
            end
%             A(i,j) = alpha;
        end
end
disp(L)
disp(U)
end
