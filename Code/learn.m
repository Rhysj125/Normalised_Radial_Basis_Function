function weights = learn(weights, currentY, demandedY, phi)

    global learningRate;

    %Training the out weights of the hidden nodes using the delta rule
    %newWeights = outWeights + learningRate*(yDesired - yNetwork)*node activation function
    error = demandedY - currentY;
    error = error*phi;

    weights = weights + learningRate*error;

end

