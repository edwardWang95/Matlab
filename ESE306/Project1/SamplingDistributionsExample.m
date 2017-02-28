clear % Remove any exsiting variables in the workspace
close all % Close all figure windows
clc % Clear Command Window

%**************************************************************************
% Program name:     SamplingDistributionsExample.m
% Author:           Vibha Mane
% Date Created:     December 26, 2016
% Last Update:      December 26, 2016
%
% Sampling from Various Distributions, and computing the moments 
%**************************************************************************

NSize = 10000; % number of samples
Ap = 700; % Ap and Bp are the parameters of the Beta Distribution
Bp = 300;

%**************************************************************************
% Draw samples from the beta distribution, with parameters Ap and Bp;
rndArray = betarnd(Ap, Bp, [1, NSize]);

% Plot a histogram
NBins = 100;   % number of bins in the histogram
histogram(rndArray, NBins);

%title('Samples from Beta Distribution', 'Color', [.27 .89 .76])

% Compute the sample mean and variance
MeanData = mean(rndArray);
VarData = var(rndArray);

% Moments utilizing the 'betastat' function
[mu, var] = betastat(Ap, Bp);

% Compute the parameters of the distribution from data, utilizing the
% 'betafit' function
param = betafit(rndArray);
