def sensorData(a1, a2)
    return 0 if a1.count != a2.count
    counter = 0

    while counter <= a1.count - 1
        actualResult = (a2[counter] - a1[counter])
    
        puts actualResult.abs
        counter += 1
    end
end