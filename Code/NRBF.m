function NRBF()
    
    global trainFile;
    global testFile;
    global nodeSize;
    global node;
    global iterations;
    global inputs;
    global learningRate;
    RMSETrain = ones(1,iterations);
    RMSETest = ones(1,iterations);
    networkOutput = zeros(size(trainFile, 1), 1);
    currentX = zeros(1, inputs);
    radius = nodeSize*0.44;
    
    %Runs the learning process for the number of iterations set
    for h = 1: iterations
        %Goes through every item in the dataset
        for i = 1:size(trainFile, 1)
            
            %getting the current data sample
            j = 1:inputs;
            currentX(j) = trainFile(i,j);
            demandedY = trainFile(i,inputs+1);
            
            %Calculating the y and phi values of the network for current X
            %values.
            [currentY, phi] = calcCurrentY(currentX);
            
            nodeFound = 0;
            %%
            nodeID = 0;
            
            %Getting the highest phi value.
            [M,I] = max(phi(1,:));
            
            %Checking whether the current X values are within the node with
            %the highest phi value.
            outsideNode = 0;
            for input = 1:inputs
                if((node(I,input) - currentX(input))^2) > (radius^2)
                    outsideNode = 1;
                end
            end

            %Setting the node ID to be changed.
            if(outsideNode == 0)
                nodeID = I;
            end
            
            %Checking if the node ID has been set.
            if(nodeID > 0)
                %Moving the node closer to the X Values.
                for input = 1:inputs
                    nodeFound = 1;
                    node(nodeID, input) = 0.8*node(nodeID, input) + 0.2*currentX(input);
                end
                %Change the output weights of the node.
                node(nodeID,inputs+1) = learn(node(nodeID,inputs+1), currentY, demandedY, phi(nodeID));
            end
        
            %%
            %brings in a new node if needed
            if(nodeFound == 0)
                getNewNode(currentX, inputs);
            end

            
            networkOutput(i) = currentY;
        end
        %%
        %Calculates the Error in both training and testing data
        averageYErrorTrain = 0;
        averageYErrorTest = 0;
        
        for i = 1:size(trainFile)
            averageYErrorTrain = averageYErrorTrain + (trainFile(i,inputs+1) - networkOutput(i))^2; 
        end
        
        j = 1:inputs;
        for i = 1:size(testFile)
            currentX(j) = testFile(i,j);
            averageYErrorTest = averageYErrorTest + (testFile(i,inputs+1) - calcCurrentY(currentX))^2;
        end
        
        %Calculate the RMSE for the current iteration
        RMSETrain(h) = sqrt(averageYErrorTrain/size(trainFile, 1));
        RMSETest(h) = sqrt(averageYErrorTest/size(testFile,1));
    end
    %%
    figure('name','RMSE');
    plot(RMSETrain)
    hold on
    plot(RMSETest)
    hold off
    ylim([0 0.5]);
    xlim([0 iterations]);
    legend('Train', 'Test');
    title('RMSE');
    
end