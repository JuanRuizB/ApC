function [xdata,ydata] = generadatos(tam)
NUMPOINTS=1000;
%Generamos la funcion sin ruido..
x = 4*(rand(1,NUMPOINTS)-0.5);
yok = 1.8*tanh(3.2*x + 0.8)- 2.5*tanh(2.1*x + 1.2)-0.2*tanh(0.1*x - 0.5);

RUIDO = 0.2*std(yok); % Definimos el ruido.

NUMDATA = tam; 

xdata = 4*(rand(1,NUMDATA)-0.5);
ydata = 1.8*tanh(3.2*xdata + 0.8)- 2.5*tanh(2.1*xdata + 1.2) - 0.2*tanh(0.1*xdata - 0.5) + RUIDO*randn(size(xdata));
end

