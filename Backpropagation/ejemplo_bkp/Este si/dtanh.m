function  Y=dtanh(X)
%
%[DTANH] function  Y=dtanh(X)
%
% Calcula la derivada de la funcion tanh.

S=tanh(X);
Y=1-(S.^2);


