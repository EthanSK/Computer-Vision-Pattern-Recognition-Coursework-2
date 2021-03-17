function [] = performClustering(data, distMethod, linkageMethod, task)
%performClustering - performs and visualises clustering in 3d, and shows dendogram

pdistance = pdist(data, distMethod);
tree = linkage(pdistance, linkageMethod);
clusterIdxs = cluster(tree, 'Maxclust', 6);

figure;
scatter3(data(:, 1), data(:, 2), data(:, 3), 36, clusterIdxs, 'filled')
xlabel('Pressure');
ylabel('Vibration');
zlabel('Temperature');
saveas(gcf, sprintf('../report/sectionD/%s/PVT_cluster_%s.png', task, distMethod));

figure();
dendrogram(tree);
saveas(gcf, sprintf('../report/sectionD/%s/dendogram_%s.png', task, distMethod));

    
end