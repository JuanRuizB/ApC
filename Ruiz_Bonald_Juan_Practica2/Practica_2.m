clear all, close all, clc;
repeticiones = 30; %Número de veces que se ejecuta cada metodo.
tam = 50;
while tam < 101
[xdata,ydata] = generadatos(tam); %Generamos la muestra a utilizar

% Llamamos a los metodos.
[error_Minimo,grado_optimo] = k_CV(xdata,ydata,repeticiones);

[error_Minimo1,grado_optimo1] = bootstrap(xdata,ydata,repeticiones);

[error_Minimo2, grado_optimo2] = fpe_penalty(xdata,ydata,repeticiones);

[error_Minimo3, grado_optimo3] = sic_penalty(xdata,ydata,repeticiones);

% Preparamos los datos para poder dibujar la grafica de cajas y bigotes.
CV = ['k_CV    '];
B = ['Boostrap'];
F = ['FPE     '];
S = ['SIC     '];
Metodos = [repmat(CV,repeticiones,1); repmat(B,repeticiones,1); repmat(F,repeticiones,1); repmat(S,repeticiones,1)];


grados = [grado_optimo grado_optimo1 grado_optimo2 grado_optimo3];
Minimo = [error_Minimo error_Minimo1 error_Minimo2 error_Minimo3];

%Pintamos las graficas.
figure,boxplot(grados,Metodos),
title(['TAMAÑO: ',num2str(tam)]),
xlabel('Metodos'),
ylabel('Modelos Seleccionados');

figure,boxplot(Minimo,Metodos),
title(['TAMAÑO: ',num2str(tam)]),
xlabel('Metodos'),
ylabel('Error Minimo');
tam = tam + 50;
end