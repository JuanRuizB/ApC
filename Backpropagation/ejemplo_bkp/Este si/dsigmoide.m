function Y=dsigmoide(X)
%
%[DSIGMOOIDE] function Y=dsigmoide(X)
%
% Devuelve la derivada de la funcion sigmoide
%
s=sigmoide(X);
Y=s.*(1.-s);




