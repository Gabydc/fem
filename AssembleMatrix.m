function [S]=AssembleMatrix(elmat,Selem,n)
S = zeros(n,n);

for i = 1 : n-1
    for j = 1 : 2
        for k = 1 : 2
            S(elmat(i, j), elmat(i, k)) = S(elmat(i, j), elmat(i, k))+Selem(j, k);
        end
    end
end
end