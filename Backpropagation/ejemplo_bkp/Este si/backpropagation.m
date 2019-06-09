

function S = backpropagation(X,Y)


E=[X(1,:);X(2,:)];    			
Sal=[Y];


Nocultas=9;

PO=rand(3,Nocultas);
PS=rand(Nocultas+1,1);

[fila,columna]=size(E);

iter=0;
epoch=10000;
Error=10;

P=0;
Q=0;
while Error>0.01 && iter < epoch
     Error=0;
     iter=iter+1;
	 for j=1:1:columna
           [WSalida,WOcultos,S(j)]=delta2c(E(:,j),Sal(j),PS,PO,0.03,'tanh');
           PS=WSalida;
           PO=WOcultos;
           Error=Error+ ( Sal(j) - S(j) )^2;
     end
      MError(iter)=Error/2;
        
end
S = round(S);
end


