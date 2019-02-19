function testValues(day, month, hour)

    %Displays the output for a specific day, month and hour.
    currentX(1) = day/31;
    currentX(2) = month/12;
    currentX(3) = hour/24;
    
    y = calcCurrentY(currentX);
    
    disp(y*77896);

end

