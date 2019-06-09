
% load iris.dat
  
function [W1,Y] = backpropagation(W,Xin,Ytarget,alpha,bias)
num_capas = length(W);

iter = 0;
while iter < 10000
    
    mean(Error{num_capas})
    x = propagacion(W{1},Xin,bias);
    for c = 1:num_capas
        Y{c} = f_activacion(x);
        if c ~= num_capas
        w = W{c+1};
        x = propagacion(w,Y{c},bias);
        end
    end
    
    for c = num_capas:-1:1
        
        E =[];
        if c == num_capas
            w_old = W{c};
            for k = 1:size(W{c},2)

                E =Y{c}(:,k).*(1 - Y{c}(:,k)).*(Ytarget - Y{c}(:,k));
%                 tam = length(E);
%                 E = sumsqr(E)/tam;
%                 num = length(find(E ~= 0));
%                 E = num/tam*100;

                Eaux = alpha.*E.*Y{c}(:,k);%Y{c}(:,k)
                in = mean(mean(Eaux));
                W{c}(:,k) = W{c}(:,k) + in;
                Error{c}(k,:) = in;
            end
        else
            w = W{c};
            for k = 1:size(W{c},2)
                E = Y{c}(:,k).*(1 - Y{c}(:,k))*(w_old(k,1:end)*Error{c+1});
                E = mean(E);
                Eaux = alpha.*E.*Y{c}(:,k);
                in = mean(Eaux);
                W{c}(:,k) = W{c}(:,k) + in;
                Error{c}(k,:) = E;
            end
            w_old = w;
        end
    end
    iter = iter + 1;
end
W1 = W;
Y = Y{num_capas};
end