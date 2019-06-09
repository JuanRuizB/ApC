function [W,iter] = AdalineTRAIN(alpha,X,tipo)
i = 1;
iter = 0;
W = [ 0   0    0]; %Primeros pesos. 
error = 0;
aciertos = 0;
switch tipo %Esto hace que la funcion se pueda utilizar para entrenar el 
    % Adaline como OR o como AND.
    case 'OR'
        salida_D = [-1 1 1 1];

    case 'AND'
        salida_D = [-1 -1 -1 1];
end


while aciertos < 10 
    salida_O = X(i,:)*W';    %Algoritmo de Adaline(transparencias de clase)
    error_old = error;
    error = salida_D(i) - salida_O;
    W = W + alpha*error* X(i,:);
    
    if i == 4 %reiniciamos la "i" si esta ha alcanzado un mayor valor de 4,
              %ya que queremos comprobar los 4 inputs que le hemos pasado.         
        i = 0;
    end
    i = i + 1; 
    if abs(abs(error) - abs(error_old)) < 0.00001 %Condición de parada del
                                                  %entrenamiento.
                                                  %Ya que el ADALINE nunca
                                                  %dará un error 0.
        aciertos = aciertos + 1;
    else
        aciertos = 0;
    end
    iter = iter + 1;
end
end