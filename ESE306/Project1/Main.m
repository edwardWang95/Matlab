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
            %Binomial
            obj.binomial();
            break;
        case 2
            %Poisson
            obj.poisson();
            break;
        case 3
            %Normal
            obj.normal();
            break;
        case 4
            obj.betaBinomialPDF();
            break;
        case 5
            obj.betaBinomialPMF();
            break;
        otherwise
            fprintf('Incorrect Input\n');
    end
end
