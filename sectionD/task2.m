load('../matfiles/F1_electrode_pca.mat');
load('../matfiles/F1_electrode_data.mat');

performBagging(169, EStandardized, 'raw');
performBagging(30, EStandardized, 'raw');

performBagging(169, EProjectedPCA3d, 'pca');
performBagging(30, EProjectedPCA3d, 'pca');


function performBagging(treeCount, data, name)
    load('../matfiles/names.mat');

    rng(420);
    labels = repelem(names, 10);

    [testIdxs, trainIdxs] = testTrainSplit(data, 0.4);

    testLabels = labels(testIdxs, :);
    testData = data(testIdxs, :);
    trainLabels = labels(trainIdxs, :);
    trainData = data(trainIdxs, :);


    model = TreeBagger(treeCount, trainData, trainLabels, 'OOBPrediction', 'on');
    

    viewAndSaveTree(model.Trees{1}, sprintf('../report/sectionD/task2/%d_%s_tree1.png', treeCount, name));
    viewAndSaveTree(model.Trees{2}, sprintf('../report/sectionD/task2/%d_%s_tree2.png', treeCount, name));
    
    figure;
    plot(oobError(model))
    xlabel 'Trees Grown';
    ylabel 'Out of Bag Error';
    saveas(gcf, sprintf('../report/sectionD/task2/%d_%s_oob_error.png', treeCount, name));

    predLabels = string(predict(model, testData));

    figure;
    confusionchart(testLabels, predLabels);
    saveas(gcf, sprintf('../report/sectionD/task2/%d_%s_confusion_matrix.png', treeCount, name));
end

function [] = viewAndSaveTree(tree, filepath)
    before = findall(groot, 'Type','figure');
    view(tree, 'Mode', 'graph');
    after = findall(groot, 'Type', 'figure');
    h = setdiff(after, before);
    saveas(h, filepath)
end
