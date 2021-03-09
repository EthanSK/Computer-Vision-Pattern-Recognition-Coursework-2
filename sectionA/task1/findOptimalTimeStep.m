function [optimalTimeStep] = findOptimalTimeStep()
%findOptimalTimeStep - Calculates the best time step to use


[carSpongeMean, carSpongeVar] = aggregateObjectData("car_sponge_101");
[blackFoamMean, blackFoamVar] = aggregateObjectData("black_foam_110");
[kitchenSpongeMean, kitchenSpongeVar] = aggregateObjectData("kitchen_sponge_114");
[acrylicMean, acrylicVar] = aggregateObjectData("acrylic_211");
[steelVaseMean, steelVaseVar] = aggregateObjectData("steel_vase_702");
[flourSackMean, flourSackVar] = aggregateObjectData("flour_sack_410");

means = [carSpongeMean blackFoamMean kitchenSpongeMean acrylicMean steelVaseMean flourSackMean];
vars = [carSpongeVar blackFoamVar kitchenSpongeVar acrylicVar steelVaseVar flourSackVar];

% varOfMeansF1pac = var(carSpongeMean.F1pac, blackFoamMean.F1pac, kitchenSpongeMean.F1pac, acrylicMean.F1pac, steelVaseMean.F1pac, flourSackMean.F1pac)

maxScore = 0;
maxTimeStep = 0;

for i = 1:1000

    varOfMeansF1pac = var(arrayfun(@(objectMean) objectMean.F1pac(i), means));
    varOfMeansF1tdc = var(arrayfun(@(objectMean) objectMean.F1tdc(i), means));
    varOfMeansF1pdc = var(arrayfun(@(objectMean) objectMean.F1pdc(i), means));
    varOfMeansF1Electrodes = var(arrayfun(@(objectMean) objectMean.F1Electrodes(i), means)) ;   

    meanOfTrialVarsF1pac = mean(arrayfun(@(objectVar) objectVar.F1pac(i), vars));
    meanOfTrialVarsF1tdc = mean(arrayfun(@(objectVar) objectVar.F1tdc(i), vars));
    meanOfTrialVarsF1pdc = mean(arrayfun(@(objectVar) objectVar.F1pdc(i), vars));
    meanOfTrialVarsF1Electrodes = mean(arrayfun(@(objectVar) objectVar.F1Electrodes(i), vars));

    varOfMeansCombined = mean([varOfMeansF1pac varOfMeansF1tdc varOfMeansF1pdc varOfMeansF1Electrodes]); %TODO - normalize?
    meanOfTrialVarsCombined = mean([meanOfTrialVarsF1pac meanOfTrialVarsF1tdc meanOfTrialVarsF1pdc meanOfTrialVarsF1Electrodes]);

    score = varOfMeansCombined / meanOfTrialVarsCombined;
    % score = varOfMeansCombined;
    if score > maxScore
        maxScore = score;
        maxTimeStep = i;
    end
end

disp(["The max score was ", maxScore, "for time step ", maxTimeStep])
optimalTimeStep = maxTimeStep;


% %%pseudocode (v1)%%%%%%%%%%%%%%%%

% for i in range (1, 1000):
%     varOfMeansF1pac = var([carSpongeMean.F1pac[1][i], blackFoamMean.F1pac[1][i], kitchenSpongeMean.F1pac[1][i], etc...])
%     varOfMeansF1tdc = var([carSpongeMean.F1tdc[1][i], blackFoamMean.F1tdc[1][i], kitchenSpongeMean.F1tdc[1][i], etc...])
%     ...etc...


% then normalize each of these varOfMeansX and average them togothere
% %%%%%%%%%%%%%%%%


% %%%pseudocode v2%%%%%%%%%%%%%
% for i in range (1, 1000):

%     meanOfTrialVarsF1pac = mean([carSpongeVar.F1pac[1][i], blackFoamVar.F1pac[1][i], kitchenSpongeVar.F1pac[1][i], etc...])
%     meanOfTrialVarsF1tdc = mean([carSpongeVar.F1tdc[1][i], blackFoamVar.F1tdc[1][i], kitchenSpongeVar.F1tdc[1][i], etc...])
%     ...etc...

% then somehow combine each mean, normalizing it? or just normalize it first
% %%%%%%%%%%%%%%%%%

% the find the time step with the highest v1/v2



% meanOfVars = mean(carSpongeVar, blackFoamVar, kitchenSpongeVar, acrylicVar, steelVaseVar, flourSackVar)

end