load('../matfiles/colors.mat');
load('../matfiles/F1_electrode_data.mat');

EStandardized = zeros(60, 19);
for i = 1:19
    EStandardized(:, i) = normalize(E(:, i));
end


ECovariance = cov(EStandardized);

[eigVecs, eigVals] = eigOrdered(ECovariance);

%scree plot
figure;
plot(eigVals, 'o-');
grid on;

%plot 3d representation
featureVec3d = eigVecs(:, 1:3); 
projected3d = EStandardized * featureVec3d;

plotData(@(i, startIdx, endIdx) scatter3(projected3d(startIdx:endIdx, 1), projected3d(startIdx:endIdx, 2), projected3d(startIdx:endIdx, 3), 'MarkerFaceColor', colors(i, :)))
xlabel('PC1');
ylabel('PC2');
zlabel('PC3');