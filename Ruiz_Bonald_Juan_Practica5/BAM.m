
function Y = BAM(x,y)

y_old = zeros(size(x,1),size(x,2));
W = trnPesosBAM(x,y); %Se entrenan los pesos.
    
    y = hardlims(x*W);
    x = hardlims(y*W'); % Primera iteración.
    
iter = 1
while y_old ~= y
    y_old = y;
    y = hardlims(x*W);
    x = hardlims(y*W'); % Bucle hasta que se estabilice.
    
    iter = iter + 1 %Contador de iteraciones para su estudio.
end
Y = y;
end