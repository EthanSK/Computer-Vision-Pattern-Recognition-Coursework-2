objectIdxs = [4 6]; % Flour Sack & Steel Vase

plotLDA2d(objectIdxs, [1 2]); % PV
saveas(gcf, sprintf('../report/sectionC/task1d/PV.png'));

plotLDA2d(objectIdxs, [1 3]); % PT
saveas(gcf, sprintf('../report/sectionC/task1d/PT.png'));

plotLDA2d(objectIdxs, [2 3]); % TV
saveas(gcf, sprintf('../report/sectionC/task1d/TV.png'));

plotLDA3d(objectIdxs, [1 2 3]); % PVT
saveas(gcf, sprintf('../report/sectionC/task1d/PVT.png'));
