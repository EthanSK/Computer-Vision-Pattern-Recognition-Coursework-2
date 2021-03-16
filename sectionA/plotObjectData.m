function [] = plotObjectData(objectData)
%plotVariables - Plots the variables from the data of a given mat object

numRows = 2;
numCols = 4;

figure;

subplot(numRows, numCols, 1);
plot(objectData.F0pdc, 'Color', '#4287f5');
title('Pressure');
ylabel('Finger 0');

subplot(numRows, numCols, 2);
plot(objectData.F0pac(2,:), 'Color', '#f542aa');
title('Vibration');

subplot(numRows, numCols, 3);
plot(objectData.F0tdc, 'Color', '#42f569');
title('Temperature');

subplot(numRows, numCols, 4);
plot(objectData.F0Electrodes');
title('Electrodes');

subplot(numRows, numCols, 5);
plot(objectData.F1pdc, 'Color', '#4287f5');
ylabel('Finger 1');

subplot(numRows, numCols, 6);
plot(objectData.F1pac(2,:), 'Color', '#f542aa');

subplot(numRows, numCols, 7);
plot(objectData.F1tdc, 'Color', '#42f569')

subplot(numRows, numCols, 8);
plot(objectData.F1Electrodes');

end