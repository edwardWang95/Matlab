function BetaBin(numRed, numGreen, numberOfTrials, numberOfSamples)
wholeTest=zeros([1 numberOfSamples]);
for test = 1:numberOfSamples
    success=0;
    for trial = 1:numberOfTrials
        probA=numRed/(numRed+numGreen);
        A=rand;
        if A < probA
            success=success+1;
            numRed=numRed+1;
        else 
            numGreen=numGreen+1;
        end
    end
    
    wholeTest(test)=success;
end
histogram(wholeTest);
MeanData = mean(wholeTest);
VarData = var(wholeTest);
meanTheor = numberOfTrials*numRed/(numRed+numGreen);
redandgreen=numRed+numGreen;
rag=redandgreen+1;
varDenom=redandgreen*redandgreen*rag;
ragn=redandgreen+numberOfTrials;
varTheor = numberOfTrials*numRed*numGreen*ragn/varDenom;
fprintf('BetaBinomial Distribution\n');
fprintf('Sample Mean: %f\n', MeanData);
fprintf('Sample Variance: %f\n', VarData);
fprintf('Theoretical Mean: %f\n', meanTheor);
fprintf('Theoretical Variance: %f\n', varTheor);


end

