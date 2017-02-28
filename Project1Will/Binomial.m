function Binomial(numTrials, probability, numOfSamples )
r=binornd(numTrials, probability, [1, numOfSamples]);
histogram(r,numTrials);
% Compute the sample mean and variance
MeanData = mean(r);
VarData = var(r);

% Moments utilizing the 'betastat' function
[mu, variance] = binostat(numTrials, probability);
fprintf('Binomial Distribution\n');
fprintf('Sample Mean: %f\n', MeanData);
fprintf('Sample Variance: %f\n', VarData);
fprintf('Theoretical Mean: %f\n', mu);
fprintf('Theoretical Variance: %f\n', variance);
end

