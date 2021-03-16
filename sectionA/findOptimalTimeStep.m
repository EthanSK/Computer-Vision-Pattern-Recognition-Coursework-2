function [optimalTimeStep, scores] = findOptimalTimeStep()
%findOptimalTimeStep - Calculates the best time step to use

[carSpongeMean, carSpongeVar, carSpongeVarNorm] = aggregateObjectData("car_sponge_101");
[blackFoamMean, blackFoamVar, blackFoamVarNorm] = aggregateObjectData("black_foam_110");
[kitchenSpongeMean, kitchenSpongeVar, kitchenSpongeVarNorm] = aggregateObjectData("kitchen_sponge_114");
[acrylicMean, acrylicVar, acrylicVarNorm] = aggregateObjectData("acrylic_211");
[steelVaseMean, steelVaseVar, steelVaseVarNorm] = aggregateObjectData("steel_vase_702");
[flourSackMean, flourSackVar, flourSackVarNorm] = aggregateObjectData("flour_sack_410");

means = [carSpongeMean blackFoamMean kitchenSpongeMean acrylicMean steelVaseMean flourSackMean];
vars = [carSpongeVar blackFoamVar kitchenSpongeVar acrylicVar steelVaseVar flourSackVar];
varNorms = [carSpongeVarNorm blackFoamVarNorm kitchenSpongeVarNorm acrylicVarNorm steelVaseVarNorm flourSackVarNorm];

scores = zeros(1000, 1);
maxScore = 0;
optimalTimeStep = 0;

for i = 1:1000

    varOfMeansF1pac = var(arrayfun(@(objectMean) objectMean.F1pac(i), means));
    varOfMeansF1tdc = var(arrayfun(@(objectMean) objectMean.F1tdc(i), means));
    varOfMeansF1pdc = var(arrayfun(@(objectMean) objectMean.F1pdc(i), means));
    varOfMeansF1Electrodes = var(arrayfun(@(objectMean) objectMean.F1Electrodes(i), means)) ;   

    meanOfTrialVarsF1pac = mean(arrayfun(@(objectVar) objectVar.F1pac(i), vars));
    meanOfTrialVarsF1tdc = mean(arrayfun(@(objectVar) objectVar.F1tdc(i), vars));
    meanOfTrialVarsF1pdc = mean(arrayfun(@(objectVar) objectVar.F1pdc(i), vars));
    meanOfTrialVarsF1Electrodes = mean(arrayfun(@(objectVar) objectVar.F1Electrodes(i), vars));

    varOfMeansCombined = mean([varOfMeansF1pac varOfMeansF1tdc varOfMeansF1pdc varOfMeansF1Electrodes]);
    meanOfTrialVarsCombined = mean([meanOfTrialVarsF1pac meanOfTrialVarsF1tdc meanOfTrialVarsF1pdc meanOfTrialVarsF1Electrodes]);

    score = varOfMeansCombined / meanOfTrialVarsCombined;
    scores(i) = score;
    if score > maxScore
        maxScore = score;
        optimalTimeStep = i;
    end
end
end