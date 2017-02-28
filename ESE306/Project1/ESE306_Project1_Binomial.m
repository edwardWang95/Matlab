clear % Remove any exsiting variables in the workspace
close all % Close all figure windows
clc % Clear Command Window

%**************************************************************************
% Program name:     ESE306_Project1_Binomial.m
% Author:           Edward Wang && Vineet Lachwani
% Date Created:     February 27, 2017
% Last Update:      February 27, 2017
%
% Sampling from Various Distributions, and computing the moments 
%**************************************************************************
%Prompt user for input
disp('Binomial');
prompt = 'Enter number of trials: ';
SampleSize = input(prompt);
N = SampleSize;
prompt = 'Enter probability of each success: ';
P = input(prompt);

binArray = binornd(N,P, [1,N]);

%Test - try values of #of trials = 100 and p needs to be a decimal
histogram(binArray, N);

%Mean and Variance
binMean = mean(binArray);
binVar = var(binArray);

% Moments utilizing the 'betastat' function
[mu, var] = binostat(N, P);

% Compute the parameters of the distribution from data, utilizing the
% 'betafit' function
param = binofit(binArray, N);
