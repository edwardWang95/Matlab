function Normal(mu, sigma, numOfSamples)
r=normrnd(mu, sigma, [1,numOfSamples]);
histogram(r);
MeanData = mean(r);
VarData = var(r);
[mu, variance] = normstat(mu, sigma);
fprintf('Poisson Distribution\n');
fprintf('Sample Mean: %f\n', MeanData);
fprintf('Sample Variance: %f\n', VarData);
fprintf('Theoretical Mean: %f\n', mu);
fprintf('Theoretical Variance: %f\n', variance);
end