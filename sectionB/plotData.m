function [] = plotData(plotFn)
    
figure;
for i = 1:6
    startIdx = (i - 1) * 10 + 1;
    endIdx = startIdx + 9;
    plotFn(i, startIdx, endIdx)

    if i == 1
        hold on;
    end
end

legend('Acrylic', 'Black Foam', 'Car Sponge', 'Flour Sack', 'Kitchen Sponge', 'Steel Vase', 'AutoUpdate','off');
axis square;
        
end