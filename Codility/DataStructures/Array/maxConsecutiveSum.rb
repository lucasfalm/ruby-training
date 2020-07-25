def arrayMaxConsecutiveSum2(inputArray)
    maxSum = 0
    actualResult = 0
    size = inputArray.count
    i = 0
 
     while i <= size
         current = inputArray.shift
         if current.to_i <= 0
             if actualResult > maxSum
                 maxSum = actualResult
             end
             actualResult = 0
         else
             actualResult += current.to_i
         end 
         i += 1
     end 
     return -1 if maxSum <= 0
     return maxSum
 end
 