function nombre=derivadas(f)
%
%[DERIVADAS] function nombre=derivadas(f)
%
%    Devuelve el nombre de una funcion que es la derivada de la funcion de entrada
%
%

if strcmp(f,'sigmoide')
   nombre='dsigmoide';
else
   if strcmp(f,'tanh')
      nombre='dtanh';
   end
end


