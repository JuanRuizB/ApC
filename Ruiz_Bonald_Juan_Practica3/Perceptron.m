function y = Perceptron(W,X)
%La funcion perceptron simplemente devuelve los valores en funci�n de
%threshold. (x<=0 -> -1 y x>0 -> 1)
y = hardlims(X*W');
end