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
    
    methods(Static)
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
        function binArray = binomial(numOfTrials, prob, numOfSamples)
            fprintf('Binomial Distribution:\n');
            fprintf('Binomial(numOfTrials, prob, numOfSamples)\n');
            %prompt = 'Enter number of trials: ';
            %SampleSize = input(prompt);
            %numOfTrials = SampleSize;
            %prompt = 'Enter probability of each success: ';
            %prob = input(prompt);
            %prompt = 'Enter number of samples: ';
            %numOfSamples = input(prompt);
            
            %numOfTrials = 10000;
            %prob = .5;
            %numOfSamples = 10000;
            
            fprintf('Number of Trials: %f\n',numOfTrials);
            fprintf('Probability: %f\n',prob);
            fprintf('Number of Samples: %f\n',numOfSamples);
            
            %Get binomial array
            binArray = binornd(numOfTrials, prob, [1, numOfSamples]);
                %histogram(binArray,numOfTrials);
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
            meanError = getNumericalError(avg,mu);
            varianceError = getNumericalError(variance,sigma);
            fprintf('Mean error:%f\n',meanError);
            fprintf('Variance error:%f\n',varianceError);
        end
        
        %Poisson Distribution
        function poissArray = poisson(lamda, numOfSamples)
            fprintf('Poisson Distribution:\n');
            fprintf('Poisson(lamda, numOfSamples)\n');
            %prompt = 'Enter lamda:';
            %lamda = input(prompt);
            %prompt = 'Enter number of samples:';
            %numOfSamples = input(prompt);
            
            %lamda = 50;
            %numOfSamples = 1000;
            fprintf('Lamda: %f\n',lamda);
            fprintf('Number of Samples: %f\n',numOfSamples);
            
            poissArray = poissrnd(lamda, [1,numOfSamples]);
                %histogram(poissArray);
            avg = mean(poissArray);
            variance = var(poissArray);
            [mu, sigma] = poisstat(lamda);
            fprintf('Poisson Distribution\n');
            fprintf('Sample Mean: %f\n', avg);
            fprintf('Sample Variance: %f\n', variance);
            fprintf('Theoretical Mean: %f\n', mu);
            fprintf('Theoretical Variance: %f\n', sigma);
            meanError = getNumericalError(avg,mu);
            varianceError = getNumericalError(variance,sigma);
            fprintf('Mean error:%f\n',meanError);
            fprintf('Variance error:%f\n',varianceError);
        end
        
        function normalArray = normal(mu, sigma, numOfSamples)
            fprintf('Normal Distribution:\n');
            fprintf('Normal(mu, sigma, numOfSamples)\n');
            
            %mu = 10;
            %sigma = 10;
            %numOfSamples = 1000;
            
            fprintf('Mu: %f\n',mu);
            fprintf('Sigma: %f\n',sigma);
            fprintf('Number of Samples: %f\n',numOfSamples);
            
            normalArray=normrnd(mu, sigma, [1,numOfSamples]);
            histogram(normalArray);
            avg = mean(normalArray);
            variance = var(normalArray);
            [mu, sigma] = normstat(avg, variance);
            fprintf('Poisson Distribution\n');
            fprintf('Sample Mean: %f\n', avg);
            fprintf('Sample Variance: %f\n', variance);
            fprintf('Theoretical Mean: %f\n', mu);
            fprintf('Theoretical Variance: %f\n', sigma);
            meanError = getNumericalError(avg,mu);
            varianceError = getNumericalError(variance,sigma);
            fprintf('Mean error:%f\n',meanError);
            fprintf('Variance error:%f\n',varianceError);
        end
        
        function betaArray = beta(alpha, beta, numOfSamples)
            fprintf('Beta Distribution:\n');
            fprintf('Beta(alpha, beta, numOfSamples)\n');
            %numOfSamples = 10000; % number of samples
            %alpha = 700; % Ap and Bp are the parameters of the Beta Distribution
            %beta = 300;
            fprintf('Ap: %f\n',alpha);
            fprintf('Bp: %f\n',beta);
            fprintf('Number of Samples: %f\n',numOfSamples);
            betaArray = betarnd(alpha, beta, [1, numOfSamples]);
            % Plot a histogram

            %NBins = 100;   % number of bins in the histogram
            %histogram(betaArray, NBins);

            %title('Samples from Beta Distribution', 'Color', [.27 .89 .76])

            % Compute the sample mean and variance
            avg = mean(betaArray);
            variance = var(betaArray);

            % Moments utilizing the 'betastat' function
            [mu, sigma] = betastat(alpha, beta);

            % Compute the parameters of the distribution from data, utilizing the
            % 'betafit' function
            param = betafit(betaArray);
            
            fprintf('Beta Distribution\n');
            fprintf('Sample Mean: %f\n', avg);
            fprintf('Sample Variance: %f\n', variance);
            fprintf('Theoretical Mean: %f\n', mu);
            fprintf('Theoretical Variance: %f\n', sigma);
            meanError = getNumericalError(avg,mu);
            varianceError = getNumericalError(variance,sigma);
            fprintf('Mean error:%f\n',meanError);
            fprintf('Variance error:%f\n',varianceError);
            
        end
        
        %Beta Binomial
        function betaBinArray = betaBinomial(numOfTrials, numOfSamples, alpha, beta)
            fprintf('Beta-Binomial Distribution:\n');
            fprintf('Beta-Binomial(numOfTrials, numOfSamples, alpha, beta)\n');
            %Constants
            %numOfSamples = 1000; 
            %numOfTrials = 500;
            %alpha = 700; % Ap and Bp are the parameters of the Beta Distribution
            %beta = 300;
            fprintf('Number of Trials: %f\n',numOfTrials);
            fprintf('Number of Samples: %f\n',numOfSamples);
            fprintf('Ap: %f\n',alpha);
            fprintf('Bp: %f\n',beta);
            %Setup zero array to hold betaBinomia values
            betaBinArray = zeros([1, numOfSamples]);
            %Poly-Urn Models
            for set = 1:numOfSamples
               success = 0;
               for rep = 1:numOfTrials
                  probAlpha = alpha/(beta + alpha); %total prob of alpha
                  test = rand;
                  if test < probAlpha
                      %Increment success counter and alpha
                      success = success + 1;
                      alpha = alpha + 1;
                  else
                      %Else increment beta
                      beta = beta + 1;
                  end
               end
               %Set the success for each set
               betaBinArray(set) = success;
            end
            %histogram(betaBinArray);
            avg = mean(betaBinArray);
            variance = var(betaBinArray);
            %Theoretical mean 
            mu = numOfTrials * (alpha/(alpha + beta));
            %Theoretical variance
            total = beta + alpha;
            totalIncrement = total + 1;
            varDenom = total * total * totalIncrement;
            totalNum = total + numOfTrials;
            sigma = numOfTrials * alpha * beta * (totalNum/varDenom);
            %Print all values
            fprintf('BetaBinomial Distribution\n');
            fprintf('Sample Mean: %f\n', avg);
            fprintf('Sample Variance: %f\n', variance);
            fprintf('Theoretical Mean: %f\n', mu);
            fprintf('Theoretical Variance: %f\n', sigma);
            meanError = getNumericalError(avg,mu);
            varianceError = getNumericalError(variance,sigma);
            fprintf('Mean error:%f\n',meanError);
            fprintf('Variance error:%f\n',varianceError);
        end 
    end
end
