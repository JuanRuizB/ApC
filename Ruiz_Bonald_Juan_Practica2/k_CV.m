function error_Minimo = k_CV(xdata,ydata,repeticiones)
tam = length(xdata); %Tamaño de la muestra
k = 10; %Número de grupos.
n = tam/k; %Tamaño de un grupo.

for i = 1:repeticiones
    [xdata,ydata] = shuffle(xdata,ydata);
    E = [];
    Error = [];
        A = 1;%Indicacores para seleccionar los diferentes grupos.
        B = n;

        for j = 1:k
            xtrn = xdata; xtrn(A:B) = [];
            ytrn = ydata; ytrn(A:B) = [];

            xtst = xdata(A:B);%Se separan los grupos en datos de entrenamiento 
            ytst = ydata(A:B);% y de test.
                
            S = backpropagation(xtrn,ytrn) %Se calcula la y estimada.


            Error(j) = sumsqr(ytst - yestim1)/n *100; % Error cuadratico medio
            
            A = A + n;
            B = B + n; %Se suma los indicadores el tamaño de un grupo para 
%             escoger al siguiente
            xtrn = []; ytrn = [];
            xtst = []; ytst = [];
        end
        E = sum(Error)/k; %Errores obtenidos al entrenar y validar con 
%         todos los grupos.
    [error_Minimo(i),~] = min(E); %Errores minimo y grado optimo
%     de cada repeticion.
end

end
