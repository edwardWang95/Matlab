%fprintf('Binomial Distribution:\nBinomial(x,y,z)\nx = number of trials\ny = probability\nz = number of samples\n');
%fprintf('Poisson Distribution:\nPoisson(x,y)\nx = lamda\ny = number of trials\n');
%fprintf('Normal Distribution:\nNormal(x,y,z)\nx = mu\ny = sigma\nz = number of samples\n');
%fprintf('Beta Distribution:\nBeta(x,y,z)\nx = alpha\ny = beta\nz = number of samples\n');

clear % Remove any exsiting variables in the workspace
close all % Close all figure windows
clc % Clear Command Window
 
%Ask user for distribution
%Create project
obj = ESE306Project1;
while(1)
    obj.listDistributions();
    prompt = ('Choice: ');
    fprintf('\n');
    choice = input(prompt);
    fprintf('\n');
    switch choice
        case 0
            break;
        case 1
            %Binomial(numOfTrials, prob, numOfSamples)
            obj.binomial(20,.5,20);
            
            fprintf('Binomial Distribution 1\n');
            binArray1 = obj.binomial(20,.5,200);
            fprintf('\n');
            fprintf('Binomial Distribution 2\n');
            binArray2 = obj.binomial(40,.5,200);
            %Display Graphs
            subplot(2,1,1);       % add first plot in 2 x 2 grid
            histogram(binArray1);          % line plot
            title('Binomial Distribution 1');
            subplot(2,1,2);       % add first plot in 2 x 2 grid
            histogram(binArray2);           % line plot
            title('Binomial Distribution 2');
            break;
        case 2
            %Poisson(lamda, numOfSamples)
            fprintf('Poisson Distribution 1\n');
            poissArray1 = obj.poisson(1,100);
            fprintf('\n');
            fprintf('Poisson Distribution 2\n');
            poissArray2 = obj.poisson(4,100);
            %Display Graphs
            subplot(2,1,1);       % add first plot in 2 x 2 grid
            histogram(poissArray1);          % line plot
            title('Poisson Distribution 1');
            subplot(2,1,2);       % add first plot in 2 x 2 grid
            histogram(poissArray2);           % line plot
            title('Poisson Distribution 2');

            break;
        case 3
            %Normal(mu, sigma, numOfSamples)
            fprintf('Normal Distribution 1\n');
            normalArray1 = obj.normal(-2,.5,100);
            fprintf('\n');
            fprintf('Normal Distribution 2\n');
            normalArray2 = obj.normal(0,.2,100);
            %Display Graphs
            subplot(2,1,1);       % add first plot in 2 x 2 grid
            histogram(normalArray1);          % line plot
            title('Normal Distribution 1');
            subplot(2,1,2);       % add first plot in 2 x 2 grid
            histogram(normalArray2);           % line plot
            title('Normal Distribution 2');
            break;
        case 4
            %Beta(Ap, Bp, numOfSamples)
            fprintf('Beta Distribution 1\n');
            betaArray1 = obj.beta(.5,.5,500);
            fprintf('\n');
            fprintf('Beta Distribution 2\n');
            betaArray2 = obj.beta(1,3,500);
            %Display Graphs
            subplot(2,1,1);       % add first plot in 2 x 2 grid
            histogram(betaArray1);          % line plot
            title('Beta Distribution 1');
            subplot(2,1,2);       % add first plot in 2 x 2 grid
            histogram(betaArray2);           % line plot
            title('Beta Distribution 2');
            break;
        case 5
            %BetaBinomial(numOfTrials, numOfSamples, alpha, beta)            
            fprintf('Beta-Binomial Distribution 1\n');
            betaBinArray1 = obj.betaBinomial(10,100,2,5);
            fprintf('\n');
            fprintf('Beta-Binomial Distribution 2\n');
            betaBinArray2 = obj.betaBinomial(10,100,600,400);
            %Display Graphs
            subplot(2,1,1);       % add first plot in 2 x 2 grid
            histogram(betaBinArray1);          % line plot
            title('Beta-Binomial Distribution 1');
            subplot(2,1,2);       % add first plot in 2 x 2 grid
            histogram(betaBinArray2);           % line plot
            title('Beta-Binomial Distribution 2');
            break;
        otherwise
            fprintf('Incorrect Input\n');
    end
end
