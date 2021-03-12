function [] = lineInfinite(A, B)

% xlim = get(gca, 'XLim');
% m = (B(2) - B(1)) / (A(2) - A(1));
% n = B(2) * m - A(2);
% y1 = m * xlim(1) + n;
% y2 = m * xlim(2) + n;

axis manual;
line(A * 10, B * 10);

end


