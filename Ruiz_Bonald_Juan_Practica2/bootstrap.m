function [error_Minimo,grado_optimo] = bootstrap(xdata,ydata,repeticiones)
tam = length(xdata);%Tamaño de la muestra
k = 10; %Número de muestras bootstrap.
for i = 1:repeticiones
    [xdata,ydata] = shuffle(xdata,ydata);
    E = [];
    Error = [];
    n = fix(tam*0.632); %Número de datos destinados a la muestra bootstrap
    for grado = 1:30
        
        for j = 1:k
            r = randi(tam,1,tam-n);
            xtrn = [xdata(1:n) xdata(r)]; %Se rellena hasta alcanzar el tamaño 
            ytrn = [ydata(1:n) ydata(r)]; % de la muestra original escogiendo
            xtst = xdata(n+1:end); % números aleatorios de esta.
            ytst = ydata(n+1:end);
            
            p=polyfit(xtrn,ytrn,grado);
            yestim1 = polyval(p,xtst);%Se calcula la y estimada.


            Error(j) = sumsqr(ytst - yestim1)/100 *100;  % Error cuadratico medio
            
        end
        E(grado) = sum(Error)/k;%Errores obtenidos al entrenar y validar con 
%         todas las muestras de bootstrap.
    end
    [error_Minimo(i),grado_optimo(i)] = min(E); %Errores minimo y grado optimo
%     de cada repeticion.

end

end