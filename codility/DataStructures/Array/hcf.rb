def gcd(a, b)
    return b if a == 0 
    return a if b == 0 
    return gcd(b , a % b)
end


def gcdn(array, n)
    temp = array[0]
    i = 0

    while i <= n
        temp = gcd(temp, array[i])
        i += 1
    end

    return temp
end