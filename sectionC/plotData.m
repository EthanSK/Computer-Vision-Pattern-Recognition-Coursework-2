function [] = plotData(objectA, objectB, plotFn)
    
    figure;
    for i = 1:2
        startIdx = (i - 1) * 10 + 1;
        endIdx = startIdx + 9;
        plotFn(i, startIdx, endIdx)
    
        if i == 1
            hold on;
        end
    end
    
    legend(objectA, objectB, 'AutoUpdate','off');
    axis square;
            
end