function [returnY, phiSum]= calcCurrentY(currentX)

    global numOfNodes;
    global node;
    global inputs;
    
    phi = zeros(numOfNodes,inputs);
    phiSum = zeros(1,numOfNodes);
    
    %Calculating the activation function for every node in the network
    for i = 1:numOfNodes
        for j = 1:inputs
            phi(i, j) = hiddenNodeFunction(currentX(j),i, j);
        end
        phiSum(i) = sum(phi(i,:));
    end
    
    %Multiplying the activation functions by the corresponding weight
    y = phiSum * node(:,inputs+1);
    
    %Deviding the output by the sum of the activation values to get the
    %normalised output.
    returnY = y/sum(phiSum);

end

