function [Selem]=GenerateElementMatrix(D,lambda,n)
h = 1/(n-1);
Selem(1,1) = D/h + lambda*h/3;
Selem(1,2) = -D/h + lambda*h/6;
Selem(2,1) = -D/h + lambda*h/6;
Selem(2,2) = D/h + lambda*h/3;
end
