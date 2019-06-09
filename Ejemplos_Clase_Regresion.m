clear all, close all,clc
NUMPOINTS=1000;
%Generador de ejemplos.
x = 4*(rand(1,NUMPOINTS)-0.5);
yok = 1.8*tanh(3.2*x + 0.8)- 2.5*tanh(2.1*x + 1.2)-0.2*tanh(0.1*x - 0.5);

RUIDO = 0.2*std(yok);
yruido = RUIDO*randn(size(yok));
y = yok + yruido;
figure, plot(x,y,'.b'); hold,plot(x,yok,'.k'); drawnow;

% -------------------------------------------------------------------------
NUMDATA=30;
xdata = 4*(rand(1,NUMDATA)-0.5);
ydata = 1.8*tanh(3.2*xdata + 0.8)- 2.5*tanh(2.1*xdata + 1.2) - 0.2*tanh(0.1*xdata - 0.5) + RUIDO*randn(size(xdata));

figure, plot(xdata,ydata,'or'); hold on, plot(x,yok,'.b'); drawnow;

% minimizar la funcion E=(Y-BX)^2 ===> X'Y=X'BX ==> B=inv(X'X)XY = pinv(X)Y
X=[ones(1,NUMDATA);xdata;xdata.^2;xdata.^3;xdata.^4;xdata.^5]';
B=pinv(X)*ydata';
ynew=X*B;

plot(xdata,ynew,'ok')
p=polyfit(xdata,ydata,5);
plot(xdata,polyval(p,xdata),'.g')