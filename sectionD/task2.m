
load('../matfiles/F1_electrode_data.mat');
load('../matfiles/names.mat');

labels = repelem(names, 10);

[testIdxs, trainIdxs] = testTrainSplit(EProjectedPCA3d, 0.4);

testLabels = labels(testIdxs, :);
testData = EProjectedPCA3d(testIdxs, :);
trainLabels = labels(trainIdxs, :);
trainData = EProjectedPCA3d(trainIdxs, :);

model = TreeBagger(169, trainData, trainLabels, 'OOBPrediction', 'on');
view(model.Trees{1}, 'Mode', 'graph')
saveas(gcf, sprintf('../report/sectionD/task2/tree1.png'));

view(model.Trees{2}, 'Mode', 'graph')
saveas(gcf, sprintf('../report/sectionD/task2/tree2.png'));

figure;
plot(oobError(model))
xlabel 'Trees Grown';
ylabel 'Out of Bag Error';
saveas(gcf, sprintf('../report/sectionD/task2/oob_error.png'));

predLabels = string(predict(model, testData));

figure;
confusionchart(testLabels, predLabels);
saveas(gcf, sprintf('../report/sectionD/task2/confusion_matrix.png'));
