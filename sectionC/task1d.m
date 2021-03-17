objectIdxs = [4 6]; % Flour Sack & Steel Vase

plotLDA2d(objectIdxs, [1 2], 'task1d', 'PV'); % PV
plotLDA2d(objectIdxs, [1 3], 'task1d', 'PT'); % PT
plotLDA2d(objectIdxs, [2 3], 'task1d', 'TV'); % TV
 
plotLDA3d(objectIdxs, [1 2 3], 'task1d', 'PVT'); % PVT
 