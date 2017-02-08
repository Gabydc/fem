
%
% This routine constructs the large matrices and vector.
%
% The element matrices and vectors are also dealt with.
%
%
% First the internal element contributions
%
% First Initialisation of large discretisation matrix, right-hand side vector

S 		= sparse(n,n); % stiffness matrix

f 		= zeros(n,1); % right-hand side vector

%
% Treatment of the internal (triangular) elements
%

for i = 1:length(elmat(:,1)) % for all internal elements
	GenerateElementMatrix; % Selem	
    for ind1 = 1:topology
        for ind2 = 1:topology
            S(elmat(i,ind1),elmat(i,ind2))	= S(elmat(i,ind1),elmat(i,ind2)) + Selem(ind1,ind2);
        end;
    end;
	GenerateElementVector; % felem
    for ind1 = 1:topology
        f(elmat(i,ind1)) = f(elmat(i,ind1)) + felem(ind1);
    end;
end;

% Next the boundary contributions

for i = 1:length(elmatbnd(:,1)); % for all boundary elements extension of mass matrix M and element vector f
	GenerateBoundaryElementMatrix; % BMelem
    for ind1 = 1:topologybnd
        for ind2 = 1:topologybnd
            S(elmatbnd(i,ind1),elmatbnd(i,ind2)) = S(elmatbnd(i,ind1),elmatbnd(i,ind2)) + BMelem(ind1,ind2);
        end;
    end;
	GenerateBoundaryElementVector; % bfelem   
    for ind1 = 1:topologybnd
        f(elmatbnd(i,ind1)) = f(elmatbnd(i,ind1)) + bfelem(ind1);
    end;
end;
