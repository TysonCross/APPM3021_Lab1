% APPM3021 Lab 1, Exercise 1

clc
clear all

A = [ 1 1 1 2;...
      1 2 4 1;...
     -1 0 3 1;...
      2 0 2 4]
  
rows = length(A);
b = randi(10,rows,1)

solution = gaussElimination(A,b)                    % Here is the function

% Output and check
check = A\b;
if ~isequal(solution,check)
    warning(['Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution-check))))])
end

