def arrayMaxConsecutiveSum2(inputArray)
    p0 = 0
    maxConsecutive = Array.new(0)
    maxResult = 0
    
    while p0 <= inputArray.count
        current = inputArray[p0]
        if current.to_i >= 0
            maxConsecutive << current.to_i
        else
            maxSum = 0
            i = 0
            while i <= maxConsecutive.count
                maxSum += maxConsecutive[i].to_i
                i += 1
            end

            if maxSum == 0 
                maxResult = maxSum
            end
            if maxSum > maxResult
                maxResult = maxSum
            end
            
            maxConsecutive = Array.new(0)
        end
        
        p0 += 1
    end
    return -1 if maxResult <= 0
    return maxResult
end
