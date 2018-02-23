% APPM3021 Lab 1, Exercise 1

clc
clear all

A = [ 1 1 1 2;...
      1 3 2 1;...
     -1 1 3 1;...
      1 0 2 4]
  
b = [2; 0; 3; 2]

solution = gaussElimination(A,b)                    % Here is the function

% Output and check
correct_solution = A\b;
if ~isequal(solution,correct_solution)
    warning(['Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution-correct_solution))))])
end

