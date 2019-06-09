function W = trnPesosBAM(X,Y)
M = size(X,2);
W = (X'*Y)/M; %Entrenamiento de los pesos.
end