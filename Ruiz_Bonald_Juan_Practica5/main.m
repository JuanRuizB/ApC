clear all, close all, clc;
[X,Y] = generaDatosHopfield();

% generaDatosHopfield devuelve 7 patrones debido a que en el modelo de
% Hopfield, el máximo número de patrones de entrada debe ser: N/4*ln(N).
% Siendo N el número de inputs introducidos.

for i = 1:7

figure,
subplot(1,2,1),imshow(reshape(X(i,:),12,12)),title('Imagen con Ruido');
St = hopfield(X(i,:),Y);
subplot(1,2,2),imshow(reshape(St,12,12)),title('Imagen Obtenida');
    
end
% -------------------------------BAM---------------------------------------
[X,Y] = generaDatosBAM();

% generaDatosBAM devuelve 4 patrones debido a que como en el modelo
% Hopfield, el máximo número de patrones de entrada es N/4*ln(N).
% Siendo N el número de inputs introducidos.

St = BAM(X,Y);


for i = 1:4
figure,
subplot(1,2,1),imshow(reshape(X(i,:),9,9)'),title('Imagen con Ruido');

subplot(1,2,2),imshow(reshape(St(i,:),9,9)'),title('Imagen Obtenida');
    
end
