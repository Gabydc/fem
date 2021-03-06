
% Module for element mass matrix for reactive term
%
% Output: Selem  ====== 2 x 2 matrix
%
% Selem(1,1), Selem(1,2), Selem(1,3), Selem(2,1), Selem(2.2), Selem(2,3),
%
% Selem(3,1), Selem(3,2), Selem(3,3) to be computed in this routine.
%
% elmat(i,1), elmat(i,2), elmat(i,3) give the index numbers of the vertices of element i
%
% x(elmat(i,j)), y(elmat(i,j)) give the coordinates of the vertices
%
% i = index number of element, imported from AssemblyStepStiffnessMatrix.m
%
% Selem(index1,index2) = (grad phi(elmat(i,index1)),grad phi(i,index2))
%

clear xc
clear yc
clear Selem
%Define velocity
vx = 10 / sqrt(2);
vy = 5 / sqrt(2);
Qp = 1 *10^(-1);
ncell = 5;

for index1 = 1:topology
	xc(index1) = x(elmat(i,index1));
	yc(index1) = y(elmat(i,index1));
end;

Delta = det([1 xc(1) yc(1);1 xc(2) yc(2);1 xc(3) yc(3)]);

B_mat = [1 xc(1) yc(1);1 xc(2) yc(2);1 xc(3) yc(3)] \  eye(3);

alpha = B_mat(1,1:3);
beta  = B_mat(2,1:3);
gamma = B_mat(3,1:3);


ci = zeros(1,5);
for p = 1 : 5
xc1(p) = 0.6 * cos(2 * pi * (p-1) / 5);
yc1(p) = 0.6 * sin(2 * pi * (p-1) / 5);

Delta1 = det([1 xc1(p) yc1(p);1 xc(2) yc(2);1 xc(3) yc(3)]);
Delta2 = det([1 xc(1) yc(1);1 xc1(p) yc1(p);1 xc(3) yc(3)]);
Delta3 = det([1 xc(1) yc(1);1 xc(2) yc(2);1 xc1(p) yc1(p)]);

Dc = abs(Delta1) + abs(Delta2) + abs(Delta3);
if abs(Dc - Delta) < eps
    ci(p) = 1;
end
end

%Compute determinants of distance between mesh points and the cell




if abs(ci*ci') == 0
%Point sink outside

for index1 = 1:topology
	for index2 = 1:topology
        Selem(index1,index2) = abs(Delta)/2*DiffCoeff*(beta(index1)*beta(index2)+gamma(index1)*gamma(index2))+abs(Delta)/6*(vx*beta(index1)+vy*gamma(index1));
	end;
end;

else

%Point sink inside
for index1 = 1:topology
	for index2 = 1:topology
        cell = 0 ;
        for p = 1 : ncell
            if ci(p) == 1
            cell = cell + Qp * [alpha(index1)+beta(index1)*xc1(p)+gamma(index1)*yc1(p)] * [alpha(index2)+beta(index2)*xc1(p)+gamma(index2)*yc1(p)]; 
            end
        end
        Selem(index1,index2) = abs(Delta)/2*DiffCoeff*(beta(index1)*beta(index2)+gamma(index1)*gamma(index2)) + abs(Delta)/6*(vx*beta(index1)+vy*gamma(index1))+cell;
	end;
end;

end


