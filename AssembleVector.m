function [f]=AssembleVector(felem,elmat,n)
f=zeros(n,1);
for i=1:n-1
    for j=1:2
        f(elmat(i,j)) = f(elmat(i,j)) + felem(j,i);
    end
end
end