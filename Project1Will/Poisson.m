function Poisson(lamda, numOfSamples)
r=poissrnd(lamda, [1,numOfSamples]);
histogram(r);
MeanData = mean(r);
VarData = var(r);
[mu, variance] = poisstat( lamda);
fprintf('Poisson Distribution\n');
fprintf('Sample Mean: %f\n', MeanData);
fprintf('Sample Variance: %f\n', VarData);
fprintf('Theoretical Mean: %f\n', mu);
fprintf('Theoretical Variance: %f\n', variance);
end

