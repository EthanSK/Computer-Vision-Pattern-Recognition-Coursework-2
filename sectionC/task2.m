load('../matfiles/colors.mat');
load('../matfiles/names.mat');
load('../matfiles/F1_PVT_data.mat');

objectIdxs = [2 3];
metricIdxs = [1 2 3];

metricNames = ["Pressure"; "Vibration"; "Temperature"];
colors = colors(objectIdxs, :);

[eigVecs, ~, PVTStandardized, means] = performLDA(objectIdxs, metricIdxs);

plotData(names(objectIdxs(1), :), names(objectIdxs(2), :), @(i, startIdx, endIdx) scatter3(PVTStandardized(startIdx:endIdx, metricIdxs(1)), PVTStandardized(startIdx:endIdx, metricIdxs(2)),  PVTStandardized(startIdx:endIdx, metricIdxs(3)), 'MarkerFaceColor', colors(i, :)))
xlabel(metricNames(metricIdxs(1), :));
ylabel(metricNames(metricIdxs(2), :));
zlabel(metricNames(metricIdxs(3), :));

for i = 1:2
    plot3(means(metricIdxs(1), i), means(metricIdxs(2), i), means(metricIdxs(3), i),  'o', 'MarkerFaceColor', colors(i, :), 'MarkerSize', 15)
end

lineLength = 10;
verts = zeros(3, 2);
for i = 1:2
    verts(:, i) = [
        eigVecs(1, i) * lineLength;
        eigVecs(2, i) * lineLength;
        eigVecs(3, i) * lineLength;
    ];
    line([-verts(1, i) verts(1, i)], [-verts(2, i) verts(2, i)], [-verts(3, i) verts(3, i)])
end

axis square;
xlim([-3, 3]);
ylim([-3, 3]);
zlim([-3, 3]);

patch('Faces', [1 3 2 4], 'Vertices', [verts(:, 1)'; -verts(:, 1)'; verts(:, 2)'; -verts(:, 2)'], 'FaceAlpha', 0.5, 'FaceColor', 'red');

%plot 2d representation
featureVec2d = eigVecs(:, 1:2); 
projected2d = PVTStandardized * featureVec2d;

plotData(names(objectIdxs(1)), names(objectIdxs(2)), @(i, startIdx, endIdx) scatter(projected2d(startIdx:endIdx, 1), projected2d(startIdx:endIdx, 2), 'MarkerFaceColor', colors(i, :)));
grid on;

xlabel('LD1');
ylabel('LD2');
