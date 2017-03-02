%**************************************************************************
% Program name:     ESE306_Project1_Binomial.m
% Author:           Edward Wang && Vineet Lachwani
% Date Created:     February 27, 2017
% Last Update:      February 27, 2017
%
% ESE 306 Project showing binomial,
%
%
%
%
%**************************************************************************
classdef ESE306Project1
    properties
    end
    
    methods(Static = true)
        %Constructor
        function obj = ESE306Project1()
           
        end
        
        function listDistributions()
            fprintf('ALL DISTRIBUTIONS\n');
            fprintf('1]Binomial\n');
            fprintf('2]Poisson\n');
            fprintf('3]Normal\n');
            fprintf('4]Beta\n');
            fprintf('5]BetaBinomial\n');
            fprintf('0]Exit\n');   
        end
        
        %Binomial
        function binomial()
            fprintf('Binomial Distribution:\n');
            fprintf('Binomial(numOfTrials, prob, numOfSamples)\n');
            %prompt = 'Enter number of trials: ';
            %SampleSize = input(prompt);
            %numOfTrials = SampleSize;
            %prompt = 'Enter probability of each success: ';
            %prob = input(prompt);
            %prompt = 'Enter number of samples: ';
            %numOfSamples = input(prompt);
            
            numOfTrials = 10000;
            prob = .5;
            numOfSamples = 10000;
            
            fprintf('Number of Trials: %f\n',numOfTrials);
            fprintf('Probability: %f\n',prob);
            fprintf('Number of Samples: %f\n',numOfSamples);
            
            %Get binomial array
            binArray = binornd(numOfTrials, prob, [1, numOfSamples]);
            histogram(binArray,numOfTrials);
            %Compute the sample mean and variance
            avg = mean(binArray);
            variance = var(binArray);
            %Moments utilizing the 'binostat' function
            [mu, sigma] = binostat(numOfTrials, prob);
            % Compute the parameters of the distribution from data
            param = binofit(binArray, numOfTrials);
            fprintf('Sample Mean: %f\n', avg);
            fprintf('Sample Variance: %f\n', variance);
            fprintf('Theoretical Mean: %f\n', mu);
            fprintf('Theoretical Variance: %f\n', sigma);
                %fprintf('Distribution Parameters: %f\n', param);
        end
        
        %Poisson Distribution
        function poisson()
            fprintf('Poisson Distribution:\n');
            fprintf('Poisson(lamda, numOfSamples)\n');
            %prompt = 'Enter lamda:';
            %lamda = input(prompt);
            %prompt = 'Enter number of samples:';
            %numOfSamples = input(prompt);
            
            lamda = 50;
            numOfSamples = 1000;
            fprintf('Lamda: %f\n',lamda);
            fprintf('Number of Samples: %f\n',numOfSamples);
            
            poissArray = poissrnd(lamda, [1,numOfSamples]);
            histogram(poissArray);
            avg = mean(poissArray);
            variance = var(poissArray);
            [mu, sigma] = poisstat(lamda);
            fprintf('Poisson Distribution\n');
            fprintf('Sample Mean: %f\n', avg);
            fprintf('Sample Variance: %f\n', variance);
            fprintf('Theoretical Mean: %f\n', mu);
            fprintf('Theoretical Variance: %f\n', sigma);
        end
        
        function normal()
            fprintf('Normal Distribution:\n');
            fprintf('Normal(mu, sigma, numOfSamples)\n');
            
            mu = 10;
            sigma = 10;
            numOfSamples = 1000;
            
            fprintf('Mu: %f\n',mu);
            fprintf('Sigma: %f\n',sigma);
            fprintf('Number of Samples: %f\n',numOfSamples);
            
            normalArray=normrnd(mu, sigma, [1,numOfSamples]);
            histogram(normalArray);
            MeanData = mean(normalArray);
            VarData = var(normalArray);
            [mu, variance] = normstat(mu, sigma);
            fprintf('Poisson Distribution\n');
            fprintf('Sample Mean: %f\n', MeanData);
            fprintf('Sample Variance: %f\n', VarData);
            fprintf('Theoretical Mean: %f\n', mu);
            fprintf('Theoretical Variance: %f\n', variance);
        end
        
        function beta()
            fprintf('Beta Distribution:\n');
            fprintf('Beta(Ap, Bp, numOfSamples)\n');
            NSize = 10000; % number of samples
            Ap = 700; % Ap and Bp are the parameters of the Beta Distribution
            Bp = 300;
            fprintf('Ap: %f\n',Ap);
            fprintf('Bp: %f\n',Bp);
            fprintf('Number of Samples: %f\n',NSize);
            rndArray = betarnd(Ap, Bp, [1, NSize]);
            % Plot a histogram
            NBins = 100;   % number of bins in the histogram
            histogram(rndArray, NBins);

            %title('Samples from Beta Distribution', 'Color', [.27 .89 .76])

            % Compute the sample mean and variance
            MeanData = mean(rndArray);
            VarData = var(rndArray);

            % Moments utilizing the 'betastat' function
            [mu, variance] = betastat(Ap, Bp);

            % Compute the parameters of the distribution from data, utilizing the
            % 'betafit' function
            param = betafit(rndArray);
            
            fprintf('Beta Distribution\n');
            fprintf('Sample Mean: %f\n', MeanData);
            fprintf('Sample Variance: %f\n', VarData);
            fprintf('Theoretical Mean: %f\n', mu);
            fprintf('Theoretical Variance: %f\n', variance);
            
        end
        
        %Beta Binomial
        function betaBinomialPMF()
            fprintf('Beta-Binomial Distribution:\n');
            fprintf('Binomial(numOfTrials, numOfSamples, alpha, beta)\n');
            prompt = 'Enter number of trials: ';
            SampleSize = input(prompt);
            numOfTrials = SampleSize;
            prompt = 'Enter probability of each success: ';
            prob = input(prompt);
            prompt = 'Enter number of samples: ';
            numOfSamples = input(prompt);
            
        end
    end
    
end

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


