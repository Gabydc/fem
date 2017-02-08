
% Module for element mass matrix for reactive term
%
% Output: felem  ====== vector of two components
%
% felem(1), felem(2) to be computed in this routine.

clear felem

for index1 = 1:topology
	    global_index = elmat(i,index1);
		felem(index1) = abs(Delta)/6*1;
end;
