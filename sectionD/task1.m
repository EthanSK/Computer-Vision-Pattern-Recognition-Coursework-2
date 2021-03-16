load('../matfiles/colors.mat');
load('../matfiles/F1_PVT_data.mat');

plotData(@(i, startIdx, endIdx) scatter3(PVTStandardized(startIdx:endIdx, 1), PVTStandardized(startIdx:endIdx, 2),  PVTStandardized(startIdx:endIdx, 3), 'MarkerFaceColor', colors(i, :)))
xlabel('Pressure');
ylabel('Vibration');
zlabel('Temperature');

performClustering(PVTStandardized, 'euclidean', 'average');
performClustering(PVTStandardized, 'cityblock', 'average');
