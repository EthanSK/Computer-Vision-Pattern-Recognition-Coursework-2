objects = [
    "steel_vase_702_10_HOLD";
    "steel_vase_702_06_HOLD";
    "kitchen_sponge_114_08_HOLD";
    "kitchen_sponge_114_04_HOLD";
    "car_sponge_101_05_HOLD";
    "car_sponge_101_03_HOLD";
]

for i = 1:length(objects)
    objectData = matfile("../data/" + objects(i));
    plotObjectData(objectData);
    saveas(gcf, sprintf('../report/sectionA/task1/%s.png', objects(i)));
end


[optimalTimeStep, scores] = findOptimalTimeStep();

figure;
plot(scores);
saveas(gcf, sprintf('../report/sectionA/task1/timeStepScores.png'));
