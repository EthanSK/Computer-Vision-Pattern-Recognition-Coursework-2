function [] = plotData(plotFn, names)
%plotData - plots data for two objects and a given anonymous function
    
figure;
for i = 1:6
    startIdx = (i - 1) * 10 + 1;
    endIdx = startIdx + 9;
    plotFn(i, startIdx, endIdx)
    hold on;
end

legend(names, 'AutoUpdate', 'off');
axis square;
        
end