load('../matfiles/colors.mat');
load('../matfiles/F1_PVT_data.mat');

PVTStandardized = [
    normalize(PVT(:, 1)) normalize(PVT(:, 2)) normalize(PVT(:, 3))
];

PVTCovariance = cov(PVTStandardized);

[eigVecs, eigVals] = eigOrdered(PVTCovariance);


plotData(@(i, startIdx, endIdx) scatter3(PVTStandardized(startIdx:endIdx, 1), PVTStandardized(startIdx:endIdx, 2),  PVTStandardized(startIdx:endIdx, 3), 'MarkerFaceColor', colors(i, :)))
xlabel('Pressure');
ylabel('Vibration');
zlabel('Temperature');

origin = zeros(1, 3);
quiver3(origin, origin, origin, eigVecs(1,:), eigVecs(2,:), eigVecs(3,:));

featureVec2d = eigVecs(:, 1:2); 
projected2d = PVTStandardized * featureVec2d;


plotData(@(i, startIdx, endIdx) scatter(projected2d(startIdx:endIdx, 1), projected2d(startIdx:endIdx, 2), 'MarkerFaceColor', colors(i, :)))
xlabel('PC1');
ylabel('PC2');