function [eigVecs, eigVals, eigVecsRaw, eigValsRaw] = eigOrdered(A)
%eigOrdered - Calculates eigenvectors and eigenvalues sorted from largest to smallest

[eigVecsRaw, eigValsRaw] = eig((A + A') / 2);
eigVals = diag(eigValsRaw);
[eigVals, sortedIdxs] = sort(eigVals, 'descend');
eigVecs = eigVecsRaw(:, sortedIdxs);

end