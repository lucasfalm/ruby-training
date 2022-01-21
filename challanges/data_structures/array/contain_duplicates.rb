def containsDuplicates(a)
    return false if a.count <= 1
    
    pointer = a.count
    current = 0

    if a.count == 2 
        return false if a[0] != a[1]
        return true
    end
    while pointer >= 0
        if a[current] == a[pointer] && current != pointer
            return true
        elsif a[current] != a[pointer]
            pointer -= 1
        elsif pointer == current
            if current == 0
                return false
            end
            pointer -= 1    
        end   
    end
    return false
end
