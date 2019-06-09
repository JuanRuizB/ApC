clear all,close all

[Wx,Wy,Bx,By] = preprocesado; % Sacamos la nube de puntos de Bank y Wine
% Aunque la SOM no precisa del vector de  pertenencia de cada patrón a 
% cada clase, le proporcionamos este porque de esta manera podemos pintar
% de distintos colores cada clase.

%% WINE %%
figure,title("Base de Datos WINE"),PesosActualizadosWINE = SOM(Wx,Wy,[4,3]);

%% BANK %%
figure,title("Base de Datos WINE"),PesosActualizadosBANK = SOM(Bx,By,[2,3]);