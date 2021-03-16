function [] = plotData(objectA, objectB, plotFn)
%plotData - plots data for two objects and a given anonymous function

figure;
for i = 1:2
    startIdx = (i - 1) * 10 + 1;
    endIdx = startIdx + 9;
    plotFn(i, startIdx, endIdx)
    hold on;
end

legend(objectA, objectB, 'AutoUpdate', 'off');
axis square;
            
end