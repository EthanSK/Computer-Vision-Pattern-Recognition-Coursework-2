function [optimalTimeStep] = findOptimalTimeStep(input)
%findOptimalTimeStep - Calculates the best time step to use


[carSpongeMean, carSpongeVar] = aggregateObjectData("car_sponge_101");
[blackFoamMean, blackFoamVar] = aggregateObjectData("black_foam_110");
[kitchenSpongeMean, kitchenSpongeVar] = aggregateObjectData("kitchen_sponge_114");
[acrylicMean, acrylicVar] = aggregateObjectData("acrylic_211");
[steelVaseMean, steelVaseVar] = aggregateObjectData("steel_vase_702");
[flourSackMean, flourSackVar] = aggregateObjectData("flour_sack_410");

varOfMeansF1pac = var(carSpongeMean.F1pac, blackFoamMean.F1pac, kitchenSpongeMean.F1pac, acrylicMean.F1pac, steelVaseMean.F1pac, flourSackMean.F1pac)

%%pseudocode (v1)%%%%%%%%%%%%%%%%

for i in range (1, 1000):
    varOfMeansF1pac = var([carSpongeMean.F1pac[1][i], blackFoamMean.F1pac[1][i], kitchenSpongeMean.F1pac[1][i], etc...])
    varOfMeansF1tdc = var([carSpongeMean.F1tdc[1][i], blackFoamMean.F1tdc[1][i], kitchenSpongeMean.F1tdc[1][i], etc...])
    ...etc...


then normalize each of these varOfMeansX and average them togothere
%%%%%%%%%%%%%%%%


%%%pseudocode v2%%%%%%%%%%%%%
for i in range (1, 1000):

    meanOfTrialVarsF1pac = mean([carSpongeVar.F1pac[1][i], blackFoamVar.F1pac[1][i], kitchenSpongeVar.F1pac[1][i], etc...])
    meanOfTrialVarsF1tdc = mean([carSpongeVar.F1tdc[1][i], blackFoamVar.F1tdc[1][i], kitchenSpongeVar.F1tdc[1][i], etc...])
    ...etc...

then somehow combine each mean, normalizing it? or just normalize it first
%%%%%%%%%%%%%%%%%

the find the time step with the highest v1/v2



% meanOfVars = mean(carSpongeVar, blackFoamVar, kitchenSpongeVar, acrylicVar, steelVaseVar, flourSackVar)

end