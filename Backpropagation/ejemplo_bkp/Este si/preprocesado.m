%% Preprocesado
function [WX,yW_,BX,yB_] = preprocesado()
clear all, close all;
rand('seed',0);randn('seed',0);
bank = readtable('bank-additional-full.csv');
% Este código sirve para numerizar las características que fueran
% cualitativas o que posean caracteres
bank.job = grp2idx(categorical(bank.job));
bank.marital = grp2idx(categorical(bank.marital));
bank.education = grp2idx(categorical(bank.education));
bank.default = grp2idx(categorical(bank.default));
bank.housing = grp2idx(categorical(bank.housing));
bank.loan = grp2idx(categorical(bank.loan));
bank.contact = grp2idx(categorical(bank.contact));
bank.month = grp2idx(categorical(bank.month));
bank.day_of_week = grp2idx(categorical(bank.day_of_week));
bank.poutcome = grp2idx(categorical(bank.poutcome));
bank.y = grp2idx(categorical(bank.y));

load wine.data;

%% WINE
xW_ = wine(:,2:end)';
yW_ = wine(:,1)';
% Calculamos la W de Fisher y después la multiplicamos por sus elementos
WWfisher = fisher(xW_,yW_,2);
WX = WWfisher*xW_;

% A = [WX;yW_];
% 
% color = ['*r';'*g';'*b'];
% figure,
% for i = 1:3
%     
% plot(A(1,round(A(3,:))==i),A(2,round(A(3,:))==i),color(i));hold on;
% 
% end
% title('WINE FISHER')

%% FISHER
bank = table2array(bank);

% Elegimos aleatoriamente las 1000 muestras que compondrán los datos
rnd = randi(41188,1,1000);
bank = bank(rnd,:);

xB_ = bank(:,1:20)';
yB_ = bank(:,21)';

% Mostramos la importancia de cada característica y nos quedamos con las 2
% primeras
[~,~,~,~,explained] = pca(xB_');
xB_(3:end,:) = [];
% Normalizamos los datos
BX = normalize(xB_);

end





