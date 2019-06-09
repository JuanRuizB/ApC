function [Wout,Whout,Sal]=delta2c(DataIn,DataWiss,Win,Whin,Factor,Funcion)

%DELTAG: [Wout,Whout,Sal] deltac(DataIn,DataWiss,Win,Whin,Factor,Funcion)
%
%	Realiza el aprendizaje mediante la REGLA DELTA GENERALIZADA
%	La red solo tiene una capa oculta.
% 	Las unidades ocultas utilizan una funcion de activacion: Funcion
%	Las unidades de salida utilizan una funcion de activacion lineal
%ENTRADAS:
%	DataIn   : Vector columna con un dato de entrada
%      	DataWiss: Salida deseada para Datain
%      	Win	: Los pesos actuales de las neuronas de salida de la red.Cada columna
%                 son los pesos asociados a una neurona. La ultima fila de pesos sera
%                 el umbral.
%       Whin	: Los pesos actuales de las neuronas ocultas. Igual que Win
%       Factor	: Factor de proporcionalidad.
%       Funcion : Es la funcion de activacion de la capa oculta.
%SALIDAS:
%       Wout 	: Los Nuevos pesos de las neuronas de salida
%       Whout   : Los nuevos pesos de las neuronas ocultas
%       Sal	    : Salida real de la red
%


%CALCULO DE LA SALIDA ACTUAL DE LA RED

%1-C�lculo las activaciones de las neuronas ocultas

     DataIn=[DataIn;1];    % A�adimos el umbral
	 Sumah=DataIn'*Whin;   % Sumatorio de las unidades ocultas
	
%2- C�lculo de las salidas de las neuronas ocultas Y(s)=sigm(s)

	 Salh=feval(Funcion,Sumah); %Salida de las unidades ocultas
   
%3- C�lculo de las activaciones de la unidades de de salida

      Entradao=[Salh,1]';   %Entrada a las unidades de Salida + umbral
      Sumao=Entradao'*Win;  %Sumatorio de las unidades de salida
       
%4- C�lculo de la salida de las neuronas de salida 

	  Sal=Sumao;            %Salida real de la red. Funcion lineal f(x)=x

%5- C�lculo de los deltas para las unidades de salida.
   
      Deltao=DataWiss-Sal';  % &o=e*d(f(x)), e=DataWiss-sal  y d(f(x))=1
        
%6- C�lculo de los deltas de las unidades ocultas

      df=derivadas(Funcion);
      d=feval(df,[Sumah,1])';
      Deltah=d.*(Win*Deltao);
  
%7- Actualizaci�n de pesos de las neuronas de salida

      Wout=Win+Factor*(Entradao*Deltao');

%8- Actualizaci�n de los pesos de las neuronas ocultas

      [f,c]=size(Deltah);
      Deltah=Deltah(1:f-1,c);
      Whout=Whin+Factor*(DataIn*Deltah');        
        
                
        
        
        