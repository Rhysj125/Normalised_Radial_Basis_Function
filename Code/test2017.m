function test2017()

    file = csvread('2017.csv',1,0);
    
    netOutput = zeros(size(file, 1), 1);
    
    RMSE = 0;
    
    %Calculates the Y value for every hour and every day for 2017
    for i = 1:size(file,1)
        currentX(1) = file(i,1);
        currentX(2) = file(i,2);
        currentX(3) = file(i,3);
        
        netOutput(i) = calcCurrentY(currentX');
        
        %Storing the Error
        RMSE = RMSE + (file(i,4) - netOutput(i))^2;
    end
    
    %Calculating the RMSE
    RMSE = sqrt(RMSE/size(netOutput,1));
    
    %Displays a graph of the network output and the actual data with the
    %RMSE error in the title
    title = '2017 Comparison. RMS Error = ';
    title = strcat(title, num2str(RMSE));
    
    figure('Name', title);
    hold on
    plot(1:size(netOutput, 1), netOutput * 77896);
    plot(1:size(netOutput,1), file(:,4)*77869);
    legend('Network produced demand', '2017 Actual demand');
    hold off
    
end

