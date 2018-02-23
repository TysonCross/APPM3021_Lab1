% APPM3021 Lab 1, Question 1d

clc
clear all

A = [ 1, -1,  2, -1;...
      2, -2,  3, -3;...
      1,  1,  1,  0;...
      1, -1,  4,  3]

B = [ -8, -10, -100;...
     -20, -20, -250;...
      -2,  -2,  -25;...
       4,   8,   80]

[n,m] = size(B);
Y = zeros(n,m);
solution = Y;

[L, U] = LUFactorization(A)

% Solve the matrix using LU decomposition
% Ax=b , A=LU, so AX=LUX=B
% UX=Y <--- LY=b

for i = 1:m
Y(:,i) = gaussElimination(L,B(:,i));
solution(:,i) = backSubstitution(U,Y(:,i));
end

solution

% Output and check
check = A\B
if ~isequal(solution,check)
    warning(['Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution-check))))])
end