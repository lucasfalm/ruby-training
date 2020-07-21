
one = "adbefg"
two = "adeb"

is_one_away(one, two)

# Big O(n)
def is_one_away(sla,slb)
    aSla = sla.split("")
    bSlb = slb.split("")
    aMaxLength = aSla.count - 1
    bMaxLength = bSlb.count - 1
    p1 = 0
    p2 = 0
    count = 0
    equal = false

    if aMaxLength - bMaxLength <= 1 || aMaxLength - bMaxLength >= -1
        while p1 <= aMaxLength && p2 <= bMaxLength do
            if aSla[p1] == bSlb[p2]
                equal = true
                p1 += 1
                p2 += 1
                next
            else
                p2 += 1
                equal = false
            end
            
            if aMaxLength > bMaxLength && bMaxLength < p2
                p2 = 0
            end

            if bMaxLength < p2 && !equal 
                count += 1
                p2 = p1 - 1
            end
            return false if count >= 2
            return false if count >= 1 && aMaxLength < bMaxLength
        end
    
        return true
    else
        return false
    end
end

is_one_away(one, two)