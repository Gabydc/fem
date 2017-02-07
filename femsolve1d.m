clear all
close all
t = 0;
%for n = [10 20 40 80 160]
n=100;
D = 1;
lambda = 1;
%fn = @(x) sin(20*x);
fn = @(x) 1;
[x] = GenerateMesh(n);
[elmat] = GenerateTopology(n);
[Selem] = GenerateElementMatrix(D,lambda,n);
[S] = AssembleMatrix(elmat,Selem,n);
[felem] = GenerateElementVector(n,fn,x);
[f] = AssembleVector(felem,elmat,n);
u = S \ f;
plot(x,u)
axis([0,1,0.8,1.2])
hold on
t = t + 1;
name{t}=num2str(n);

%end
%legend(['n=' name{1}],['n=' name{2}],['n=' name{3}],['n=' name{4}],['n=' name{5}])