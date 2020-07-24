# Big O(N) or (n log n)
def rotLeft(a, d)
    rotated = Array.new(0)
    i = 1

    while i <= d
        last = a.shift
        a.push(last)
        i += 1
    end

    return a
end