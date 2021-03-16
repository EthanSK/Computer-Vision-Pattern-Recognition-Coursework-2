function [testIdxs, trainIdxs] = testTrainSplit(data, testPercentage)

cv = cvpartition(size(data, 1), 'HoldOut', testPercentage);
testIdxs = cv.test;
trainIdxs = ~testIdxs;

end