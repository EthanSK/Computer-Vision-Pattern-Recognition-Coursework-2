function [] = plotVariables(matObj)
%plotVariables - Plots the variables from the data of a given mat object

numRows = 2
numCols = 4

figure;


subplot(numRows, numCols, 1);
plot(matObj.F0pdc, 'Color', '#D95319');
title('Pressure');
ylabel('Finger 0');


subplot(numRows, numCols, 2);
plot(matObj.F0pac(2,:), 'Color', '#77AC30');
title('Vibration');

subplot(numRows, numCols, 3);
plot(matObj.F0tdc, 'Color', '#4DBEEE');
title('Temperature');

subplot(numRows, numCols, 4);
plot(matObj.F0Electrodes);
title('Electrodes');

subplot(numRows, numCols, 5);
plot(matObj.F1pdc, 'Color', '#D95319');
ylabel('Finger 1');


subplot(numRows, numCols, 6);
plot(matObj.F1pac(2,:), 'Color', '#77AC30');

subplot(numRows, numCols, 7);
plot(matObj.F1tdc, 'Color', '#4DBEEE')

subplot(numRows, numCols, 8);
plot(matObj.F1Electrodes);


end