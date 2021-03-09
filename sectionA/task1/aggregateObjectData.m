function [objectDataMean, objectDataVar] = aggregateObjectData(objectName)
%aggregateObjectVariables - Calculates the mean of the variables across all 10 trials for an object

numTimeSteps = 1000;
numTrials = 10;

F1pac = zeros(numTrials, numTimeSteps);
F1pdc = zeros(numTrials, numTimeSteps);
F1tdc = zeros(numTrials, numTimeSteps);
F1Electrodes = zeros(numTrials, numTimeSteps);

for i = 1:numTrials
    objectPath = sprintf('../../data/%s_%02d_HOLD.mat', objectName, i);
    matObj = matfile(objectPath);
    
    F1pac(i, :) = matObj.F1pac(2, 1:numTimeSteps);
    F1pdc(i, :) = matObj.F1pdc(1, 1:numTimeSteps);
    F1tdc(i, :) = matObj.F1tdc(1, 1:numTimeSteps);
    F1Electrodes(i, :) = mean(matObj.F1Electrodes(:, 1:numTimeSteps)); %TODO: - we might not want to mean all electrodes together, will have to change struct below
end

objectDataMean = struct;
objectDataMean.F1pac = mean(F1pac);
objectDataMean.F1pdc = mean(F1pdc);
objectDataMean.F1tdc = mean(F1tdc);
objectDataMean.F1Electrodes = mean(F1Electrodes);

objectDataVar = struct;
objectDataVar.F1pac = var(F1pac);
objectDataVar.F1pdc = var(F1pdc);
objectDataVar.F1tdc = var(F1tdc);
objectDataVar.F1Electrodes = var(F1Electrodes);


end