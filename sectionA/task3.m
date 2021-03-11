% Order of colors
% acrylicData;
% blackFoamData;
% carSpongeData;
% flourSackData;
% kitchenSpongeData;
% steelVaseData;

load('../matfiles/colors.mat');
load('../matfiles/F1_PVT_data.mat');

figure;
for i = 1:6
    startIdx = (i - 1) * 10 + 1;
    endIdx = startIdx + 9;
    scatter3(PVT(startIdx:endIdx, 1), PVT(startIdx:endIdx, 2),  PVT(startIdx:endIdx, 3), 'MarkerFaceColor', colors(i, :));

    if i == 1
        hold on;
    end
end

legend('Acrylic', 'Black Foam', 'Car Sponge', 'Flour Sack', 'Kitchen Sponge', 'Steel Vase');
xlabel('Pressure');
ylabel('Vibration');
zlabel('Temperature');
axis square;