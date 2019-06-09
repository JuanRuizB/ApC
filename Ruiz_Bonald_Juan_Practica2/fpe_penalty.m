function [error_Minimo, grado_optimo] = fpe_penalty(xdata,ydata,repeticiones)
n = length(xdata);
%Haremos el método de penalización tantas veces como la variable "repeticiones"
for i=1:repeticiones
    %Haremos shuffle para mezclar los datos cada repetición
    [xdata,ydata] = shuffle(xdata,ydata);
    %Repetiremos el bucle interno tantas veces como los grados que queremos
    %examinar
    for grado = 1:30 
    %Sacamos la y estimada    
    coef = polyfit(xdata,ydata,grado);
    yestim = polyval(coef,xdata);
    %Realizamos el método de penalización
    fpe = (1+grado)./n;
    error_grado(grado) = fpe.*(sumsqr(yestim-ydata)/n);
    end
    %Seleccionamos el error mínimo y el grado que corresponde a este
    [error_Minimo(i), grado_optimo(i)]= min(error_grado);
end
end