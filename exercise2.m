% APPM3021 Lab 1, Exercise 2 

clc
clear all

rows = randi(6)+1;
A = magic(rows)
rows = length(A);
B = randi(5,rows,rows)

solution = gaussMultipleSystems(A,B)                % Here is the function

% Output and check
correct_solution = A\B;
if ~isequal(solution,correct_solution)
    warning(['Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution-correct_solution))))])
end
