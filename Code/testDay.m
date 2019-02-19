function testDay(day, month)

    currentX = zeros(24, 3);

    currentX(:, 1) = day/31;
    currentX(:, 2) = month/12;

    %Adds an hour field to each data sample for the given day and month
    for i = 1:24
        currentX(i, 3) = (i - 1)/23;
    end
    
    %Calculates the output for the whole day
    for i = 1:24
        y(i) = calcCurrentY(currentX(i,:)) * 77896;
    end
    
    %Displays a graph showing the hourly energy demand predicted by the
    %network
    title = 'Output for ';
    title = strcat(title, num2str(day));
    title = strcat(title, '/');
    title = strcat(title, num2str(month));
    figure('name', title);
    plot(0:23, y);

end