function generateNetData()

    file = csvread('2017.csv',1,0);
    
    X = zeros(1, 3);
    Y = 0;
    
    %Generating outputs for every hour for every day for 2017 using MLP
    for i = 1:size(file)
        X(:) = file(i,1:3);
        
        Y(i) = myNeuralNetworkFunction(X);
    end
    
    %Displays a graph of the network output and the actual data
    figure('name', 'MLP network')
    hold on
    plot(1:size(Y,2),Y *77869);
    plot(1:size(Y,2), file(:,4)*77869);
    legend('Network output', 'Actual output');
    hold off
    
end

