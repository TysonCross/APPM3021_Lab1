% APPM3021 Lab 1, Exercise 3 

clc
clear all

A = [8, 1, 6;...
     3, 5, 7;...
     4, 9, 2]

b = [3;9;5]

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

y = gaussElimination(L,b);
solution = backSubstitution(U,y)

% Output and check
check = A\b;
if ~isequal(solution,check)
    warning(['Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution-check))))])
end