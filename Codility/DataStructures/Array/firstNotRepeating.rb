def firstNotRepeatingCharacter(s)
    a = s.split('')
    
    p0 = 0
    p1 = a.count
    first = ''
    
    while p0 <= a.count
        if a[p0] != a[p1]
            p1 -= 1
        elsif a[p0] == a[p1] && p0 != p1
            p0 += 1
            p1 = a.count
        elsif p0 == p1
            p1 -= 1
        elsif p0 == a.count
            p1 = a.count - 1
        end 
        
        if p1 < 0 || p0 > a.count
            if p0 >= a.count
                return "_"
            end
            first = a[p0]
            return first
        end
    end    
    return "_"
end
