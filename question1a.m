% APPM3021 Lab 1, Question 1a

clc
clear all

A = [ 2,  1, -1,  2;...
      4,  5, -3,  6;...
     -2,  5, -2,  6;...
      4, 11, -4,  8]

b = [5; 9; 4; 2]

% Gauss Elimination without partial pivoting
% Using forward elimination and back substitution
solution = gaussElimination(A,b)
                                                                
% Output and check
correct_solution = A\b;
if ~isequal(solution,correct_solution)
    warning(['Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution-correct_solution))))])
end