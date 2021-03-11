timeStep = 869; %38 otherwise

data = [
    getObjectDataForTimeStep('acrylic_211', timeStep);
    getObjectDataForTimeStep('black_foam_110', timeStep);
    getObjectDataForTimeStep('car_sponge_101', timeStep);
    getObjectDataForTimeStep('flour_sack_410', timeStep);
    getObjectDataForTimeStep('kitchen_sponge_114', timeStep);
    getObjectDataForTimeStep('steel_vase_702', timeStep);
];

PVT = data(:, 1:3);
E = data(:, 4:22);

save("../matfiles/F1_PVT_data.mat", 'PVT');
save("../matfiles/F1_electrode_data.mat", 'E');