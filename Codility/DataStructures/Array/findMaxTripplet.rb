# Max triplet Big O
def solution(a)
    size = a.count - 1
    if a.count != 0 && a.count > 2
      maxPositive = Array.new(3, 0)
      maxNegative = Array.new(2, 0)

      i = 0
      
      while i <= size 
        if a[i] > maxPositive[0]
          maxPositive[2] = maxPositive[1]
          maxPositive[1] = maxPositive[0]
          maxPositive[0] = a[i]
        elsif a[i] > maxPositive[1]
          maxPositive[2] = maxPositive[1]
          maxPositive[1] = a[i]
        elsif a[i] > maxPositive[2]
          maxPositive[2] = a[i]
        elsif a[i] < maxNegative[0]
          maxNegative[1] = maxNegative[0]
          maxNegative[0] = a[i]
        elsif a[i] < maxNegative[1]
          maxNegative[1] = a[i]
        end
        i += 1
      end
      
      resultOne = maxNegative[0] * maxNegative[1] * maxPositive[0]
      resultTwo = maxPositive[0] * maxPositive[1] * maxPositive[2]
      
      return resultOne if resultOne > resultTwo
      return resultTwo
    elsif size == 2 
      return a[0] * a[1] * a[2]
    else
        return 0
    end
end