clear all, close all,clc
randn('seed',9); %Ponemos las semillas a 9 para que salga la grafica del error respecto
rand('seed',9); % del tamaño mas representativa ya que con otras semillas 
                 % salen menos intuitivas.
NUMPOINTS=1000;
%Generamos la funcion sin ruido..
x = 4*(rand(1,NUMPOINTS)-0.5);
yok = 1.8*tanh(3.2*x + 0.8)- 2.5*tanh(2.1*x + 1.2)-0.2*tanh(0.1*x - 0.5);

RUIDO = 0.2*std(yok); % Definimos el ruido.
E_emp = 0;
E_gen = 0;
S = 0.6; %Variable que representa el % de datos a utilizar para la estimación
% en el error general.
NUMDATA = 200; %Creamos los primeros 500 valores con ruidos con los que 
               % vamos a calcular el grado optimo.
xdata = 4*(rand(1,NUMDATA)-0.5);
ydata = 1.8*tanh(3.2*xdata + 0.8)- 2.5*tanh(2.1*xdata + 1.2) - 0.2*tanh(0.1*xdata - 0.5) + RUIDO*randn(size(xdata));
for i = 1:50
p=polyfit(xdata,ydata,i);
yestim1 = polyval(p,xdata);
 %Utilizamos polyfit y polyval para calcular la y estimada mediante
 %funciones polinomiales en las que utilizaremos como grado la variable i.
 
E_emp(i) = sumsqr(ydata - yestim1)/NUMDATA *100; %Error Empirico respecto al grado.

 %El error sera la diferencia de la y estimada con la y de nuestros datos
 %con ruido midiento la tasa de error como la suma de los cuadrados de
 %dicha diferencia.

 p = [];

N = NUMDATA*S; %Número de datos para la estimación.
p=polyfit(xdata(1:N),ydata(1:N),i);
yestim2 = polyval(p,xdata(N+1:end));

 %Para el error general hemos utilizado el 60% de los datos para realizar
 %la estimacion de la y e el 40% restante para calcular la tasa de error.
 
E_gen(i) = sumsqr(ydata(N+1:end) - yestim2)/(NUMDATA-N) *100; %Error General respecto al grado.
end
NUM = linspace(1,50,50);
figure,plot(NUM,E_emp);hold on;
plot(NUM,E_gen),legend('Empirico','General'),title('Errores respecto al grado'),hold off;
% Gráfica de los errores general y empirico respecto del grado de la funcion
% polinomial utilizada para estimar la y con un tamaño de la muestra de
% 500.

Error = [E_emp+E_gen];
[Error_min,grado_min_error] = min(Error); %Grado optimo con el minimo error de la  
% suma de los errores empirico y general.

for NUMDATA=50:50:5000
xdata = 4*(rand(1,NUMDATA)-0.5);
ydata = 1.8*tanh(3.2*xdata + 0.8)- 2.5*tanh(2.1*xdata + 1.2) - 0.2*tanh(0.1*xdata - 0.5) + RUIDO*randn(size(xdata));
%Generamos los datos con ruido a trabajar respecto de la variable NUMDATA.

p=polyfit(xdata,ydata,grado_min_error);
yestim1 = polyval(p,xdata); %Utilizamos polyfit y polyval para calcular la
%y estimada mediante funciones polinomiales en las que utilizaremos como 
% grado el grado optimo calculado anteriormente.

E_emp(NUMDATA/50) = sumsqr(ydata - yestim1)/NUMDATA *100; %Error Empirico respecto al tamaño.

N = NUMDATA*S;%Número de datos para la estimación.
p=polyfit(xdata(1:N),ydata(1:N),grado_min_error);
yestim2 = polyval(p,xdata(N+1:end));

E_gen(NUMDATA/50) = sumsqr(ydata(N+1:end) - yestim2)/(NUMDATA-N) *100;%Error General respecto al tamaño.

end

Error1 = [E_emp+E_gen];
[Error_min1,tam_min_error] = min(Error1);% Tamaño con el minimo error en la
% suma de los errores empirico y general.
tam_min_error = tam_min_error*50; %Multiplicamos por 50 para obtener el tamaño
% real ya que tenemos la posicion.

NUM = linspace(50,5000,100);
figure,plot(NUM,E_emp);hold on;
plot(NUM,E_gen),legend('Empirico','General'),title('Errores respecto al tamaño'),hold off;
% Gráfica de los errores general y empirico respecto del tamaño de la funcion
% polinomial utilizada para estimar la y con el grado optimo calculado antes.

%Se observa que el error general con pocos datos tiene un alto error y a
%medida que aumentamos el tamaño se regula con el error empirico.Sin embargo
%el error empirico para pocos datos tiene un error menor que a medida que 
%aumentamos el tamaño aumenta hasta regularse con el general.


