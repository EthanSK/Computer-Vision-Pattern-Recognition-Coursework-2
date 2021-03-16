timeStep = 869; %TODO:- change this

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

PVTStandardized = [
    normalize(PVT(:, 1)) normalize(PVT(:, 2)) normalize(PVT(:, 3))
];

EStandardized = zeros(60, 19);
for i = 1:19
    EStandardized(:, i) = normalize(E(:, i));
end

save("../matfiles/F1_PVT_data.mat", 'PVT', 'PVTStandardized');
save("../matfiles/F1_electrode_data.mat", 'E', 'EStandardized');