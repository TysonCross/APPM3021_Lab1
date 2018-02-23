% APPM3021 Lab 1, Question 1b

clc
clear all

A = [ 3,  1, -1;...
      1, -4,  2;...
     -2, -1,  5]

b = [3; -1; 2]

% Gauss Elimination w/o partial pivoting
% Forward elimination and back substitution
solution = gaussEliminationAltered(A,b)
                                                                
% Output and check
check = A\b;
if ~isequal(solution,check)
    warning(['Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution-check))))])
end