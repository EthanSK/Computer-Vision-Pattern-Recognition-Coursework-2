function [] = plotLDA2d(objectIdxs, metricIdxs)
    load('../matfiles/colors.mat');
    load('../matfiles/names.mat');
    load('../matfiles/F1_PVT_data.mat');

    metricNames = ["Pressure"; "Vibration"; "Temperature"];
    colors = colors(objectIdxs, :);

    [eigVecs, ~, PVTStandardized, means] = performLDA(objectIdxs, metricIdxs);

    plotData(names(objectIdxs(1), :), names(objectIdxs(2), :), @(i, startIdx, endIdx) scatter(PVTStandardized(startIdx:endIdx, metricIdxs(1)), PVTStandardized(startIdx:endIdx, metricIdxs(2)), 'MarkerFaceColor', colors(i, :)))
    xlabel(metricNames(metricIdxs(1), :));
    ylabel(metricNames(metricIdxs(2), :));
    
    plot(means(metricIdxs(1), 1), means(metricIdxs(2), 1),  'o', 'MarkerFaceColor', colors(1, :), 'MarkerSize', 15)
    plot(means(metricIdxs(1), 2), means(metricIdxs(2), 2),  'o', 'MarkerFaceColor', colors(2, :), 'MarkerSize', 15)

    lineLength = 10;
    line([-eigVecs(1, 1) eigVecs(1, 1)] * lineLength, [-eigVecs(2, 1) eigVecs(2, 1)] * lineLength)
    line([eigVecs(2, 1) -eigVecs(2, 1)] * lineLength, [-eigVecs(1, 1) eigVecs(1, 1)] * lineLength, 'LineStyle','--')
    
    axis square;
    xlim([-3, 3]);
    ylim([-3, 3]);

end
