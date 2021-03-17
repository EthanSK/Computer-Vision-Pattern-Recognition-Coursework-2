objectIdxs = [4 6]; % Flour Sack & Steel Vase

plotLDA2d(objectIdxs, [1 2],  'task1c', 'PV'); % PV
plotLDA2d(objectIdxs, [1 3],  'task1c', 'PT'); % PT
plotLDA2d(objectIdxs, [2 3], 'task1c', 'TV'); % TV
 
plotLDA3d(objectIdxs, [1 2 3], 'task1c', 'PVT'); % PVT
 