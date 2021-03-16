testObject = "../data/car_sponge_101_04_HOLD";
objectData = matfile(testObject);

plotObjectData(objectData);

[optimalTimeStep, scores] = findOptimalTimeStep();

figure;
plot(scores);