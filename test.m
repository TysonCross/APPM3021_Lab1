% A = magic(3);
% b = A(:,1);

A = [ 1, -1,  2, -1;...
      2, -2,  3, -3;...
      1,  1,  1,  0;...
      1, -1,  4,  3];

B = [ -8, -10, -100;...
     -20, -20, -250;...
      -2,  -2,  -25;...
       4,   8,   80];

[n,m] = size(B);
for i=1:m
Y(:,1) = B(:,1);
end
disp(B)
disp(Y)
