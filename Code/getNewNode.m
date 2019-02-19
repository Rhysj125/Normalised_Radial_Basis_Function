function getNewNode(currentX, inputs)

%     global numOfNodes;
%     global node;
%     nodeID = 0;
% 
%     for i = 1:numOfNodes
%         if(node(i,1) == 9999)
%             nodeID = i;
%         end
%     end

    global numOfNodes;
    global node;
       
    input = 1:inputs;
    node(numOfNodes+1, input) = currentX(input);    
    node(numOfNodes+1, inputs+1) = rand();
    
    numOfNodes = numOfNodes + 1;
end

