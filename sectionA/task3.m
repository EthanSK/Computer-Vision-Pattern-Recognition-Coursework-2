load('../matfiles/colors.mat');
load('../matfiles/names.mat');
load('../matfiles/F1_PVT_data.mat');

figure;
for i = 1:6
    startIdx = (i - 1) * 10 + 1;
    endIdx = startIdx + 9;
    scatter3(PVT(startIdx:endIdx, 1), PVT(startIdx:endIdx, 2),  PVT(startIdx:endIdx, 3), 'MarkerFaceColor', colors(i, :));
    hold on;
end

legend(names);
xlabel('Pressure');
ylabel('Vibration');
zlabel('Temperature');
axis square;

saveas(gcf, sprintf('../report/sectionA/task3/PVT_3D_scatter.png'));
