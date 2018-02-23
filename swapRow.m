function X = swapRow(A,row_1,row_2)
%   Swaps row_1 with row_2 in matrix A

temp_row = A(row_1,:);                              % store temp_row
A(row_1,:) = A(row_2,:);                            % assign new row_1 
A(row_2,:)= temp_row;                               % assign new row_2
X = A;                                              % return matrix

return