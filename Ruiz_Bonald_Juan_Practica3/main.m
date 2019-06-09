clear all, close all;
bias = 1;
X = [bias 0 0;bias 0 1;bias 1 0;bias 1 1];
tabla_OR = [-1 1 1 1];
tabla_AND =[-1 -1 -1 1];

%% 1- Mediante un perceptron modelamos las puertas lógicas AND y OR

W_OR = PerceptronTRAIN(X,'OR'); %Las funciones nos devuelven los pesos
W_AND = PerceptronTRAIN(X,'AND');%correctos del perceptron en los que
                                %se han modelado AND y OR

                             
%% 2 - Analizar la influencia de alpha en la velocidad de convergencia, y 
%% en la precisión del resultado obtenido en  ADALINE
disp("ADALINE OR");
for alphaOR = 0.1:0.1:0.9
    
    [adaOR,iterOR]=AdalineTRAIN(alphaOR,X,'OR');
    fprintf("Para un alpha de %f hemos tardado en converger %i iteraciones",alphaOR,iterOR);
    disp(" ");
    sol(1) = hardlims(X(1,:)*adaOR');
    sol(2) = hardlims(X(2,:)*adaOR');
    sol(3) = hardlims(X(3,:)*adaOR');
    sol(4) = hardlims(X(4,:)*adaOR');
    fprintf("Y tiene una precision del %d%%",length(find(sol == tabla_OR))/4*100 );
    disp(" ");
    yOR(round(alphaOR*10)) = iterOR;
end
disp(" ");
disp("ADALINE AND");
for alphaAND = 0.1:0.1:0.9
    
    [adaAND,iterAND]=AdalineTRAIN(alphaAND,X,'AND');
    fprintf("Para un alpha de %f hemos tardado en converger %i iteraciones",alphaAND,iterAND);
    disp(" ");
    sol(1) = hardlims(X(1,:)*adaAND');
    sol(2) = hardlims(X(2,:)*adaAND');
    sol(3) = hardlims(X(3,:)*adaAND');
    sol(4) = hardlims(X(4,:)*adaAND');
    fprintf("Y tiene una precision del %d%%",length(find(sol == tabla_AND))/4*100 );
    disp(" ");
    yAND(round(alphaAND*10)) = iterAND; 
end

%Pintamos las gráficas de barras con las iteraciones realizadas en cada
%valor de Alpha
x = linspace(0.1,0.9,9);

figure,bar(x,yOR,'r'),title("ADALINE OR: ALPHA/ITERACIONES");
figure,bar(x,yAND),title("ADALINE AND: ALPHA/ITERACIONES");

%% 3 - Mediante el uso de la regla del perceptrón,resolver el problema XOR.

%En esta siguiente línea, lo que hacemos es conectar las 2 neuronas creadas
%para AND y OR a una nueva neurona que nos devolverá el output del XOR. 
%
%Para ello, el input que reciba esta nueva neurona, será el output que
%devuelven las neuronas anteriores con los inputs inicialmente propuestos.
%(El primer numero corresponde al bias, que lo pondremos a 1).

Xn = [1 Perceptron(W_OR,X(1,:)) Perceptron(W_AND,X(1,:)); 
    1 Perceptron(W_OR,X(2,:)) Perceptron(W_AND,X(2,:)); 
    1 Perceptron(W_OR,X(3,:)) Perceptron(W_AND,X(3,:)); 
    1 Perceptron(W_OR,X(4,:)) Perceptron(W_AND,X(4,:)) ];


W = PerceptronTRAIN(Xn,'XOR');

%Obtenemos el output del XOR para los inputs:
%      X = [1 0 0;1 0 1;1 1 0;1 1 1];
sol(1) = hardlims(Xn(1,:)*W');
sol(2) = hardlims(Xn(2,:)*W');
sol(3) = hardlims(Xn(3,:)*W');
sol(4) = hardlims(Xn(4,:)*W');
disp(" ")
disp("Tabla de verdad calculada XOR: ");
sol(find(sol == -1)) = 0;
disp(sol);
