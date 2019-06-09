function W = PerceptronTRAIN(X,tipo)
acierto = 0;
i = 1;
W = [0 0 0];
%Según el tipo de puerta lógica que queramos, tendremos una salida deseada.
switch tipo
    case 'OR'
        salida_D = [-1 1 1 1];

    case 'AND'
        salida_D = [-1 -1 -1 1];

    case 'XOR'
        salida_D = [-1 1 1 -1];

end
%Algoritmo del perceptron (transparencias de clase)
while acierto < 4
    salida_O = Perceptron(W,X(i,:));
    if salida_O ~= salida_D(i)
        error = salida_D(i) - salida_O;
        W = W + error*X(i,:);
        acierto = 0;
    else
        acierto = acierto + 1;
    end
    if i == 4
        i = 0;
    end
    i = i + 1; 
end
end