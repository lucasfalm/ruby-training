def containsDuplicates(a)
    return false if a.count == 0
    
    pointer = a.count
    current = 0
    while pointer >= current
        return true if a[current] == a[pointer]
        pointer -= 1
        
        return false if pointer == current
    end    
end