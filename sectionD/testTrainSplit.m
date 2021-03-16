function [testIdxs, trainIdxs] = testTrainSplit(data, testPercentage)
%testTrainSplit - splits the data into random test and train indexes with a given split percentage

cv = cvpartition(size(data, 1), 'HoldOut', testPercentage);
testIdxs = cv.test;
trainIdxs = ~testIdxs;

end