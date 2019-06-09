function y = sigmoide(X)

%SIGMOIDE   y = sigmoide(X)
%	Calcula la funcion sigmoide de la matiz X
%	Devuelve una matriz donde cada elemento Y(i,j)=sigmoide(X(i,j))


y=1./(1.+exp(-X));
