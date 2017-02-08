figure(2);
trisurf(elmat,x,y,u)
figure(3);
trisurf(elmat,x,y,u);
view(2); shading interp; colormap jet; colorbar; set(gcf,'renderer','zbuffer')