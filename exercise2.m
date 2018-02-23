% APPM3021 Lab 1, Exercise 2 

clc
clear all

rows = randi(8)+1;
A = magic(rows)
rows = length(A);
B = randi(10,rows,rows)

solution = gaussMultipleSystems(A,B)                % Here is the function

% Output and check
check = A\B;
if ~isequal(solution,check)
    warning(['Solution is inaccurate, by a max difference of ',...
        num2str(max(max(abs(solution-check))))])
end
