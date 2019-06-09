function [error_Minimo,grado_optimo] = k_CV(xdata,ydata,repeticiones)
tam = length(xdata); %Tamaño de la muestra
k = 10; %Número de grupos.
n = tam/k; %Tamaño de un grupo.

for i = 1:repeticiones
    [xdata,ydata] = shuffle(xdata,ydata);
    E = [];
    Error = [];
    for grado = 1:30
        A = 1;%Indicacores para seleccionar los diferentes grupos.
        B = n;

        for j = 1:k
            xtrn = xdata; xtrn(A:B) = [];
            ytrn = ydata; ytrn(A:B) = [];

            xtst = xdata(A:B);%Se separan los grupos en datos de entrenamiento 
            ytst = ydata(A:B);% y de test.
                
            p=polyfit(xtrn,ytrn,grado);
            yestim1 = polyval(p,xtst); %Se calcula la y estimada.


            Error(j) = sumsqr(ytst - yestim1)/n *100; % Error cuadratico medio
            
            A = A + n;
            B = B + n; %Se suma los indicadores el tamaño de un grupo para 
%             escoger al siguiente
            xtrn = []; ytrn = [];
            xtst = []; ytst = [];
        end
        E(grado) = sum(Error)/k; %Errores obtenidos al entrenar y validar con 
%         todos los grupos.
    end
    [error_Minimo(i),grado_optimo(i)] = min(E); %Errores minimo y grado optimo
%     de cada repeticion.
end

end
