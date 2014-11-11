function x = magrows(x)
%MAGROWS The magnitude of rows in a matrix
%
%  x = sqrt(sum(x.^2,2))
%
%  See also MAGCOLS, NORM.
  
x = sqrt(sum(x.^2,2));