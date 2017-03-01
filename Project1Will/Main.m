
%fprintf('Binomial Distribution:\nBinomial(x,y,z)\nx = number of trials\ny = probability\nz = number of samples\n');
%fprintf('Poisson Distribution:\nPoisson(x,y)\nx = lamda\ny = number of trials\n');
%fprintf('Normal Distribution:\nNormal(x,y,z)\nx = mu\ny = sigma\nz = number of samples\n');
%fprintf('Beta Distribution:\nBeta(x,y,z)\nx = alpha\ny = beta\nz = number of samples\n');

%Ask user for distribution
%Create project
project = ESE306Project1();
while(1)
    project.listDistributions();
    prompt = ('Choice: ');
    choice = input(prompt);
    switch choice
        case 0
            break;
        case 1
            %Binomial
            fprintf('Binomial');
            break;
    end
end

%Test Binomial
fprintf('Binomial Distribution:\nBinomial(x,y,z)\nx = number of trials\ny = probability\nz = number of samples\n');
prompt = 'Enter number of trials: ';
SampleSize = input(prompt);
numOfTrials = SampleSize;
prompt = 'Enter probability of each success: ';
prob = input(prompt);
prompt = 'Enter number of samples: ';
numOfSamples = input(prompt);
project.binomial(numOfTrials, prob, numOfSamples);