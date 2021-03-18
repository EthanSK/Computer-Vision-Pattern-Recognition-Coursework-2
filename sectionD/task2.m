
performBagging(169);
performBagging(30);

function performBagging(treeCount)
    load('../matfiles/F1_electrode_pca.mat');
    load('../matfiles/names.mat');

    rng(420);
    labels = repelem(names, 10);

    [testIdxs, trainIdxs] = testTrainSplit(EProjectedPCA3d, 0.4);

    testLabels = labels(testIdxs, :);
    testData = EProjectedPCA3d(testIdxs, :);
    trainLabels = labels(trainIdxs, :);
    trainData = EProjectedPCA3d(trainIdxs, :);


    model = TreeBagger(treeCount, trainData, trainLabels, 'OOBPrediction', 'on');
    
    view(model.Trees{1}, 'Mode', 'graph')
    view(model.Trees{2}, 'Mode', 'graph')

    figure;
    plot(oobError(model))
    xlabel 'Trees Grown';
    ylabel 'Out of Bag Error';
    saveas(gcf, sprintf('../report/sectionD/task2/%d_oob_error.png', treeCount));

    predLabels = string(predict(model, testData));

    figure;
    confusionchart(testLabels, predLabels);
    saveas(gcf, sprintf('../report/sectionD/task2/%d_confusion_matrix.png', treeCount));
end

