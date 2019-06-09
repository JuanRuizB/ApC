function [X,Y] = generaDatos()
num_pat = 4;
A = imread('star.png');
B = imread('coin.png');
C = imread('mario.png');
D = imread('luigi.png');
aux{1} = A; aux{2} = B; aux{3} = C; aux{4} = D;

for i = 1:num_pat
    aux{i} = imbinarize(aux{i});
    aux{i} = aux{i}(:,:,1);
    aux{i} = aux{i}';
    X(i,:) = hardlims(aux{i}(:)-1);
    
end
n = size(X,2);
tam = num_pat * n;
Y = X;
% X = X';

for k = 1:(tam*0.5)
    i = randi(num_pat);
    j = randi(n);
    X(i,j) = hardlims(-X(i,j));
end
% X = X(1,:);
% Y = Y(1,:);
end