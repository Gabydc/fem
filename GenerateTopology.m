function [elmat] = GenerateTopology(n)
elmat(i, 1) = i;
elmat(i, 2) = i + 1;
end
