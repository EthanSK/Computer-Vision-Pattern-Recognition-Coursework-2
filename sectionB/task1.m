load('../matfiles/colors.mat');
load('../matfiles/names.mat');
load('../matfiles/F1_PVT_data.mat');

PVTCovariance = cov(PVTStandardized);

[eigVecs, ~] = eigOrdered(PVTCovariance);

%plot PVT standardized with principal component vectors
plotData(@(i, startIdx, endIdx) scatter3(PVTStandardized(startIdx:endIdx, 1), PVTStandardized(startIdx:endIdx, 2),  PVTStandardized(startIdx:endIdx, 3), 'MarkerFaceColor', colors(i, :)), names)
xlabel('Pressure');
ylabel('Vibration');
zlabel('Temperature');

origin = zeros(1, 3);
quiver3(origin, origin, origin, eigVecs(1,:), eigVecs(2,:), eigVecs(3,:));
saveas(gcf, sprintf('../report/sectionB/task1/PCA_vectors.png'));


%plot 2d representation
featureVec2d = eigVecs(:, 1:2); 
projected2d = PVTStandardized * featureVec2d;

plotData(@(i, startIdx, endIdx) scatter(projected2d(startIdx:endIdx, 1), projected2d(startIdx:endIdx, 2), 'MarkerFaceColor', colors(i, :)), names)
xlabel('PC1');
ylabel('PC2');
saveas(gcf, sprintf('../report/sectionB/task1/PCA_2D.png'));


%plot individual PC vectors
featureVec3d = eigVecs(:, 1:3); 
projected3d = PVTStandardized * featureVec3d;

grid on;
plotData(@(i, startIdx, endIdx) plotPCA(i, startIdx, endIdx, projected3d, colors), names)
yticklabels({'','PC1','PC2','PC3',''});
yticks([0 1 2 3 4]);
ylim([0 4]);
saveas(gcf, sprintf('../report/sectionB/task1/PCA_indiv.png'));


function [] = plotPCA(i, startIdx, endIdx, projected3d, colors)
    scatter(projected3d(startIdx:endIdx, 1), ones(1, 10) * 1, 'MarkerFaceColor', colors(i, :));
    scatter(projected3d(startIdx:endIdx, 2), ones(1, 10) * 2, 'MarkerFaceColor', colors(i, :));
    scatter(projected3d(startIdx:endIdx, 3), ones(1, 10) * 3, 'MarkerFaceColor', colors(i, :));
end