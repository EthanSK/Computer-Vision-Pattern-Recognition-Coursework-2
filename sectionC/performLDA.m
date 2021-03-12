function [eigVecs, eigVals, PVTStandardized, means] = performLDA(objectIdxs, metricIdxs)

load('../matfiles/colors.mat');
load('../matfiles/names.mat');
load('../matfiles/F1_PVT_data.mat');

objectARange = ((objectIdxs(1) - 1) * 10 + 1):(objectIdxs(1) * 10);
objectBRange = ((objectIdxs(2) - 1) * 10 + 1):(objectIdxs(2) * 10);

PVT = [
    PVT(objectARange, :);
    PVT(objectBRange, :);
]; % 20x3

PVTStandardized = [
    normalize(PVT(1:20, 1)) normalize(PVT(1:20, 2)) normalize(PVT(1:20, 3))
]; % 20x3

objectAPVT = PVTStandardized(1:10, :)'; % 3x10
objectBPVT = PVTStandardized(11:20, :)'; % 3x10

objectAMeans = [
    mean(objectAPVT(1, :)); mean(objectAPVT(2, :)); mean(objectAPVT(3, :));
]; % 3x1

objectBMeans = [
    mean(objectBPVT(1, :)); mean(objectBPVT(2, :)); mean(objectBPVT(3, :));
]; % 3x1

means = [
    objectAMeans objectBMeans
]; % 3x2

SwPT = ...
    (objectAPVT(metricIdxs, :) - objectAMeans(metricIdxs)) * (objectAPVT(metricIdxs, :) - objectAMeans(metricIdxs))' + ... 
    (objectBPVT(metricIdxs, :) - objectBMeans(metricIdxs)) * (objectBPVT(metricIdxs, :) - objectBMeans(metricIdxs))' ; % 2x2

SbPT = (objectAMeans(metricIdxs) - objectBMeans(metricIdxs)) * (objectAMeans(metricIdxs) - objectBMeans(metricIdxs))'; % 2x2

[eigVecs, eigVals] = eigOrdered(SwPT \ SbPT);

end
