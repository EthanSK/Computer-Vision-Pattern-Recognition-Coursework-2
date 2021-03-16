function [eigVecs, eigVals] = eigOrdered(A)
%eigOrdered - Calculates eigenvectors and eigenvalues sorted from largest to smallest

[eigVecs, D] = eig((A + A') / 2);
eigVals = diag(D);
[~, sortedIdxs] = sort(eigVals, 'descend');
eigVals = eigVals(sortedIdxs);
eigVecs = eigVecs(:, sortedIdxs);

end