function [SSelem]=GenerateElementMatrix(D,l,n)
h = 1/(n-1);
S(1,1) = D/h + l*h/3;
S(1,2) = -D/h + l*h/6;
S(2,1) = -D/h + l*h/6;
S(2,2) = D/h + l*h/3;
end
