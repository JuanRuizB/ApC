function W = SOM(X,Y,N_neuronas)
%function W = SOM(X,Y,N_neuronas)
%Devuelve el aprendizaje realizado por una red neuronal SOM.
%W es la matriz de pesos ya ajustada. 
%X es el input.
%Y es la pertenencia de
%estos inputs a cada clase (vector de enteros)
%N_neuronas es el número de
%neuronas que desea el usuario

% Creamos los pesos de las neuronas
W = gridtop(N_neuronas); 

%%%%%%% PARÁMETROS %%%%%%%
a0 = 0.8; %Ratio de Aprendizaje
a = a0;

R0 =0.5*(N_neuronas(1)*N_neuronas(2)); %Radio de vecindad
R = 2;

Vecindad = linkdist(W);

% Distancia Euclídea
% Función Bubble/Top Hat
%Inicialmente, deben usarse valores grandes del radio de vecindad y del
%ratio de aprendizaje

% Estructura creada para imprimir cada ciertas iteraciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = [1,10,500,1000,2500,5000,7500,10000];
j = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = 10000;
t = 0;
while(R>=0 || a > 0.2) && t<T
    for i = 1:size(X,2)
    % 0. Actulizamos las iteraciones    
    t = t + 1;
    % 1. Competición
        D = d_euclid(X(:,i),W);
        [~,BMU] = min(D);
    % 2. Cooperación
    % 3. Adaptación   
        %3.1 Ordenación   
        % Pintamos en las iteraciones indicadas en el vector N
        if(j<=size(N,2) && t == N(j))
        subplot(2,4,j),pintarNube2D(X,Y);hold on;plotsom(W);hold off;title("Iteracion: "+N(j));
        j = j + 1;
        end
        
        %La actualización del peso de cada unidad depende de la función de
        %vecindad que elijamos (en nuestro caso: Bubble/Top Hat)
        ind = find(Vecindad(BMU,:)<=R); 
        W(:,ind) = W(:,ind)+(a*(X(:,i)-W(:,ind)));
               
        %3.2 Convergencia
        a = a0*(1-(t/T));
        R = R0*(1-(t/T));
    end
end
end