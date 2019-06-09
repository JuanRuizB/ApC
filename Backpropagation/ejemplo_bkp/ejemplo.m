
clear all
close all

E=[-4:0.2:4];    			
Sal=sin(E).*sin(2*E);

Nocultas=9;

PO=rand(2,Nocultas);
PS=rand(Nocultas+1,1);

figure(1)
axis([-7,7,-2,2]);hold;
X=[-7:0.1:7];
Y=sin(X).*sin(2*X);
plot(X,Y,'y');
plot(E,Sal,'bo')
[fila,columna]=size(E);

iter=0;
epoch=10000;
Error=10;
ti=clock;
P=0;
Q=0;
while Error>0.01 && iter < epoch
     Error=0;
     iter=iter+1;
	 for j=1:1:columna
           [WSalida,WOcultos,S]=delta2c(E(j),Sal(j),PS,PO,0.03,'tanh');
           PS=WSalida;
           PO=WOcultos;
           Error=Error+ ( Sal(j) - S )^2;
      end
      MError(iter)=Error/2;
        
        if rem(iter,500)==0   %pintamos
           plot(P,Q,'w')
           disp(iter)
           Error
           P=[-7:0.1:7]; 
           [fila,col]=size(P);
           for i=1:1:col
               Sh=[P(i),1]*WOcultos;
	           Yh=tanh(Sh);
	           Yh=[Yh,1];
	           So=Yh*WSalida;
               Q(i)=So;
            end
            plot(P,Q,'r')
            pause(0.3)
        end
end

tf=clock;
MTiempo=[1:1:iter];

hold off
disp('Error cometido')
disp(Error)
disp('Tiempo de entrenamiento')
disp(etime(tf,ti))
figure(2);
plot(MTiempo,MError,'r');
hold;
ylabel('Error');
xlabel('Epoch');
hold off;	


