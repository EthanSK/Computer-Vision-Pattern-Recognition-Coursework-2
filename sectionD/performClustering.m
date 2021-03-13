function [] = performClustering(data, distMethod, linkageMethod)

pdistance = pdist(data, distMethod);
tree = linkage(pdistance, linkageMethod);
clusterIdxs = cluster(tree, 'Maxclust', 6);

figure;
scatter3(data(:, 1), data(:, 2), data(:, 3), 36, clusterIdxs, 'filled')
xlabel('Pressure');
ylabel('Vibration');
zlabel('Temperature');

figure();
dendrogram(tree);
    
end