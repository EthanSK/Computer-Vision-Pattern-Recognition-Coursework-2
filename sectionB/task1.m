load('../matfiles/colors.mat');
load('../matfiles/F1_PVT_data.mat');

PVTStandardized = [
    normalize(PVT(:, 1)) normalize(PVT(:, 2)) normalize(PVT(:, 3))
];

PVTCovariance = cov(PVTStandardized);

[eigVecs, eigVals] = eigOrdered(PVTCovariance);


%plot principal components
figure;
for i = 1:6
    startIdx = (i - 1) * 10 + 1;
    endIdx = startIdx + 9;
    scatter3(PVTStandardized(startIdx:endIdx, 1), PVTStandardized(startIdx:endIdx, 2),  PVTStandardized(startIdx:endIdx, 3), 'MarkerFaceColor', colors(i, :));

    if i == 1
        hold on;
    end
end

origin = zeros(1, 3);
quiver3(origin, origin, origin, eigVecs(1,:), eigVecs(2,:), eigVecs(3,:));

% featureVec2d = eigVecs(:2); 
% projected2d = PVTStandardized * featureVec2d;