% APPM3021 Lab 1, Question 1b

% clc
% clear all

A = [ 3,  1, -1;...
      1, -4,  2;...
     -2, -1,  5]

b = [3; -1; 2]

%   Gaussian elimination method for solving a single system of equations i.e. Ax = b
%   Using back elimination and forward substitution, without partial pivoting
%   This function returns the front, top triangular values as 0

if ~isSolvable(A)                                   % check is matrix is square and non-singular
    error(strcat('Matrix is not solvable'))
end

[M,y] = backElimination(A,b);
M
solution = forwardSubstitution(M, y)
            
% Output and check
correct_solution = A\b;
if ~isequal(solution,correct_solution)
    warning(['Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution-correct_solution))))])
end