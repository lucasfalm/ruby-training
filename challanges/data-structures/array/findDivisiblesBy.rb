def solution(a, b, k)
    return 0 if a == b
    isBig = false
    if k >= 1000 || b >= 1000
        a = a / 10
        b = b / 10
        k = k / 10
        isBig = true
    end

    array = (a..b).to_a
    divisibles = 0
    
    array.each do |number|
      if number % k == 0
        divisibles += 1
      end
    end
    
    return divisibles * 10 if isBig
    return divisibles
end