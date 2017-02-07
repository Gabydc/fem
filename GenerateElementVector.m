function [felem]=GenerateElementVector(n,fn,x)
h=1/(n-1);
for i=1:n-1
felem(1,i) = (h/2)*fn(x(i));
felem(2,i) = (h/2)*fn(x(i+1));
end

end