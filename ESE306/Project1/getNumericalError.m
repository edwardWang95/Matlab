function error = getNumericalError(actual, expected)
    error = ((actual - expected)/actual) * 100;
    if(error<0)
        error = error * -1;   
    end
end
