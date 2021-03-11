

timeStep = 869; %38 otherwise

acrylicData = getObjectDataForTimeStep('acrylic_211', timeStep);
blackFoamData = getObjectDataForTimeStep('black_foam_110', timeStep);
carSpongeData = getObjectDataForTimeStep('car_sponge_101', timeStep);
flourSackData = getObjectDataForTimeStep('flour_sack_410', timeStep);
kitchenSpongeData = getObjectDataForTimeStep('kitchen_sponge_114', timeStep);
steelVaseData = getObjectDataForTimeStep('steel_vase_702', timeStep);

data = [
    acrylicData;
    blackFoamData;
    carSpongeData;
    flourSackData;
    kitchenSpongeData;
    steelVaseData;
];

PVT = data(:, 1:3);
E = data(:, 4:22);

save("../matfiles/F1_PVT_data.mat", 'PVT');
save("../matfiles/F1_electrode_data.mat", 'E');