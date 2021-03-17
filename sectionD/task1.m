load('../matfiles/colors.mat');
load('../matfiles/names.mat');
load('../matfiles/F1_PVT_data.mat');

plotData(@(i, startIdx, endIdx) scatter3(PVTStandardized(startIdx:endIdx, 1), PVTStandardized(startIdx:endIdx, 2),  PVTStandardized(startIdx:endIdx, 3), 'MarkerFaceColor', colors(i, :)), names)
xlabel('Pressure');
ylabel('Vibration');
zlabel('Temperature');
saveas(gcf, sprintf('../report/sectionD/task1/PVTStandardized.png'));


performClustering(PVTStandardized, 'euclidean', 'average', 'task1');
performClustering(PVTStandardized, 'cityblock', 'average', 'task1');
