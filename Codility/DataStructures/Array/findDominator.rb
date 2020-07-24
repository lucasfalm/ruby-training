def solution(a)
    return -1 if a.count - 1 <= 1
    
    hashValues = Hash.new(0)
    dominator = 0
    indexDominator = 0
    maxValue = 0
    
    a.each_with_index do |v, i|
      hashValues[v] += 1  
      if hashValues[v] > maxValue
        dominator = v
        maxValue = hashValues[v]
      end
      
      if hashValues[v] == dominator
          indexDominator = i
      end
    end
    
    if hashValues[dominator] > (a.count - 1) / 2
      return indexDominator 
    else
      return -1
    end
end