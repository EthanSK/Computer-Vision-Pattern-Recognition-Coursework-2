objectIdxs = [4 6]; %TODO: - 4 and 6 give complex eigVecs

plotLDA2d(objectIdxs, [1 2]); % PV
plotLDA2d(objectIdxs, [1 3]); % PT
plotLDA2d(objectIdxs, [2 3]); % TV

plotLDA3d(objectIdxs, [1 2 3]);