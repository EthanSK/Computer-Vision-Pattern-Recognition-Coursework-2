function [eigVecs, eigVals] = eigOrdered(A)

[eigVecs, D] = eig(A);
eigVals = diag(D);
[~, sortedIdxs] = sort(eigVals, 'descend');
eigVals = eigVals(sortedIdxs);
eigVecs = eigVecs(:, sortedIdxs);

end