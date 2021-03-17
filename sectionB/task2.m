load('../matfiles/colors.mat');
load('../matfiles/names.mat');
load('../matfiles/F1_electrode_data.mat');

ECovariance = cov(EStandardized);

[eigVecs, eigVals] = eigOrdered(ECovariance);

%scree plot
figure;
plot(eigVals, 'o-');
xlabel('Principal Component');
ylabel('Variance');
grid on;
saveas(gcf, sprintf('../report/sectionB/task2/scree_plot.png'));

%plot 3d representation
featureVec3d = eigVecs(:, 1:3); 
projected3d = EStandardized * featureVec3d;

EProjectedPCA3d = projected3d;
save("../matfiles/F1_electrode_data.mat", 'E', 'EStandardized', 'EProjectedPCA3d');

plotData(@(i, startIdx, endIdx) scatter3(projected3d(startIdx:endIdx, 1), projected3d(startIdx:endIdx, 2), projected3d(startIdx:endIdx, 3), 'MarkerFaceColor', colors(i, :)), names)
xlabel('PC1');
ylabel('PC2');
zlabel('PC3');

saveas(gcf, sprintf('../report/sectionB/task2/PCA_3D.png'));
