clear all,close all


[Wx,Wy,Bx,By] = preprocesado; 

Wx = Wx';
Wy = Wy';

Bx = Bx';
By = By';

yest = Hierachical_clustering(Bx);

figure,scatter(Bx(:,1),Bx(:,2),50,By,'filled');