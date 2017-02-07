function [elmat] = GenerateTopology(n)
for i=1:n-1
    elmat(i, 1) = i;
    elmat(i, 2) = i + 1;
end
end
