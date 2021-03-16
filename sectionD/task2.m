
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
view(model.Trees{2}, 'Mode', 'graph')


figure;
plot(oobError(model))
xlabel 'Trees Grown';
ylabel 'Out of Bag Error';

predLabels = string(predict(model, testData));

figure;
confusionchart(testLabels, predLabels);


% % %%%%%%%%%%%%%%%%%%%%
% rng(420);

% [trainIdx, testIdx] = trainTest(0.6);

% labels(1:10) = repelem("Acrylic",10);
% labels(11:20) = repelem("Black Foam",10);
% labels(21:30) = repelem("Car Sponge",10);
% labels(31:40) = repelem("Flour Sack",10);
% labels(41:50) = repelem("Kitchen Sponge",10);
% labels(51:60) = repelem("Steel Vase",10);

% trainData = proj_data(trainIdx,1:3);
% trainLabels = labels(trainIdx);
% testData = proj_data(testIdx,1:3);
% testLabels = labels(testIdx);

% Mdl = TreeBagger(100, trainData, trainLabels, 'OOBPrediction', 'on');
% view(Mdl.Trees{1},'Mode','graph')
% view(Mdl.Trees{2},'Mode','graph')

% figure;
% subplot(1,2,1);
% oobErrorBaggedEnsemble = oobError(Mdl);
% plot(oobErrorBaggedEnsemble)
% xlabel 'Number of grown trees';
% ylabel 'Out-of-bag classification error';

% predLabels = string(predict(Mdl, testData)');

% subplot(1,2,2);
% confusionchart(testLabels, predLabels);
