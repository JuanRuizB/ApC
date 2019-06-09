function yest = Hierachical_clustering(x)
D = pdist(x);
L = linkage(D, 'single');
[a, b] = dendrogram(L);
yest = cluster(L, 'Maxclust', 3);
figure,scatter(x(:,1),x(:,2),100,yest,'filled');

end