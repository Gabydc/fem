clear xc
clear yc
clear bfelem

for index1 = 1:topologybnd
	xc(index1) = x(elmatbnd(i,index1));
	yc(index1) = y(elmatbnd(i,index1));
end;

lek = sqrt((xc(2)-xc(1))^2+(yc(2)-yc(1))^2);

for index1 = 1:topologybnd
		bfelem(index1) = h_transfer*lek/2*u_inf;
end;
