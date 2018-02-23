% APPM3021 Lab 1, Exercise 3 

clc
clear all

rows = randi(4)+1;
A = magic(rows)
rows = length(A);
b = randi(10,rows,1)

[L, U] = LUFactorization(A)                         % Here is the function

% Check the function works
lu_check = L*U;
if ~isequal(A,lu_check)
    warning(['Function is inaccurate, by a max difference of ',...
        num2str(max(max(abs(A - lu_check))))])
    disp(' ')
end

% Solve the matrix using LU decomposition
% Ax=b , A=LU, so Ax=LUx=b
% Ux=y <--- Ly=b

Y = gaussElimination(L,b);
solution = gaussElimination(U,Y)

% Output and check
check = A\b;
if ~isequal(solution,check)
    warning(['Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution-check))))])
end