% APPM3021 Lab 1, Exercise 2 

clc
clear all

A = [8, 1, 6;...
     3, 5, 7;...
     4, 9, 2]
     
B = [5, 2, 1;...
     1, 4, 3;...
     3, 4, 3]

solution = gaussMultipleSystems(A,B)                % Here is the function

% Output and check
correct_solution = A\B;
if ~isequal(solution,correct_solution)
    warning(['Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution-correct_solution))))])
end
