def top_k_frequent(words, k)
    return words if words.count == 0
    
    h = Hash.new(0)
    
    words.each do |word|
       h[word] += 1
    end
    
    result = []
    i = 1
    
    h.each do |word, key|
       result << word
        i += 1
        
        if i > k 
            return result
        end
    end
end