function [error_total, grado_op] = sic_penalty(xdata,ydata,repeticiones)
n = length(xdata);
%Haremos el m�todo de penalizaci�n tantas veces como la variable "repeticiones"
for i=1:repeticiones
    %Haremos shuffle para mezclar los datos cada repetici�n
    [xdata,ydata] = shuffle(xdata,ydata);
    %Repetiremos el bucle interno tantas veces como los grados que queremos
    %examinar
    for grado = 1:30 
    %Sacamos la y estimada        
    coef = polyfit(xdata,ydata,grado);
    yestim = polyval(coef,xdata);
    %Realizamos el m�todo de penalizaci�n
    sic = (grado*log10(n))/n;
    error_grado(grado) = sic*(sumsqr(yestim-ydata)/n);
    end
    %Seleccionamos el error m�nimo y el grado que corresponde a este
    [error_total(i), grado_op(i)]= min(error_grado);
end

end