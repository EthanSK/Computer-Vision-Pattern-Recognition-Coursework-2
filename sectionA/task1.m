objects = [
    "steel_vase_702_10_HOLD";
    "steel_vase_702_06_HOLD";
    "kitchen_sponge_114_08_HOLD";
    "kitchen_sponge_114_04_HOLD";
    "car_sponge_101_05_HOLD";
    "car_sponge_101_03_HOLD";
];


[optimalTimeStep, scores] = findOptimalTimeStep();

figure;
plot(scores);
xlabel('Time Step');
ylabel('Fitness');
saveas(gcf, sprintf('../report/sectionA/task1/timeStepScores.png'));

for i = 1:length(objects)
    objectData = matfile("../data/" + objects(i));
    plotObjectData(objectData);
    saveas(gcf, sprintf('../report/sectionA/task1/%s.png', objects(i)));
end