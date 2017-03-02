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
            fprintf('4]Befa\n');
            %fprintf('Poisson Distribution:\nPoisson(x,y)\nx = lamda\ny = number of trials\n');
            %fprintf('Normal Distribution:\nNormal(x,y,z)\nx = mu\ny = sigma\nz = number of samples\n');
            %fprintf('Beta Distribution:\nBeta(x,y,z)\nx = alpha\ny = beta\nz = number of samples\n');

            
           
        end
        
        %Binomial
        function binomial()
            fprintf('Binomial Distribution:\n');
            fprintf('Binomial(numOfTrials, prob, numOfSamples)\n');
            prompt = 'Enter number of trials: ';
            SampleSize = input(prompt);
            numOfTrials = SampleSize;
            prompt = 'Enter probability of each success: ';
            prob = input(prompt);
            prompt = 'Enter number of samples: ';
            numOfSamples = input(prompt);
            
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
            fprintf('Binomial Distribution\n');
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
            prompt = 'Enter lamda:';
            lamda = input(prompt);
            prompt = 'Enter number of samples:';
            numOfSamples = input(prompt);
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
            
        end
        
        function betaBinomialPDF()
            
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

