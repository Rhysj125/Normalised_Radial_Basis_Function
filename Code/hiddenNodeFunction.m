function output = hiddenNodeFunction(currentX, nodeID, weightID)

    global nodeSize;
    global node;

    %Creates hidden node output
    xDiff = 0;
    value = -1/(2*nodeSize^2);
    
    %Calculates the difference in the X value and the corresponding
    %Centre/in weight
    xDiff = currentX - node(nodeID,weightID);
    xDiff = xDiff* xDiff;

    %Calculates the output of the current node
    output = exp(xDiff*value);

end

