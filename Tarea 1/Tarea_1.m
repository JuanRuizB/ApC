clear all, close all, clc
load wine.data

y = wine(:,1)';
x = wine(:,2:end)';
% plotpat(x,y);
for i = 1:13
    x(:,i) = x(:,i)/norm(x(:,i));
    x(i,:) = x(i,:)/norm(x(i,:));
end
W = fisher(x,y,13);
xp = W*x;
% figure,plotpat(xp,y);

K=3;

for i = 1:3
    centroides(:,i) = kmeans(xp(:,(y == i)),K);
end

for j=1:K,
    d(j,:) = d_euclid(x,centroides(:,j));
end
[~,clase]=min(d);
tasa_acierto = sum(clase==y)/length(y)*100