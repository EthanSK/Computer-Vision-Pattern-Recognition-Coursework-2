function [res] = getObjectDataForTimeStep(object, timeStep)

    numTrials = 10;

    P = zeros(1, numTrials);
    V = zeros(1, numTrials);
    T = zeros(1, numTrials);
    E = zeros(19, numTrials);
    
    for i = 1:numTrials
        s = sprintf('../data/%s_%02d_HOLD.mat', object, i);
        matObj = matfile(s);
        P(i) = matObj.F1pdc(1, timeStep);
        V(i) = matObj.F1pac(2, timeStep);
        T(i) = matObj.F1tdc(1, timeStep);
        E(:, i) = matObj.F1Electrodes(:, timeStep);
    end

    res = [
        P;
        V;
        T;
        E;
    ]';
end