
arrayOne = [1,2,3,4,5]
arrayTwo = [3,4,5,1,6]

is_rotation(arrayOne, arrayTwo)

# Big O(n + m)
def is_rotation(arrayOne, arrayTwo)
    maxLength = arrayOne.count - 1
    p1 = 0
    p2 = maxLength

    while p1 <= maxLength && p2 >= 0 do
        puts "entrou"
        if arrayOne[p1] == arrayTwo[p2]
            p1 += 1
            p2 = maxLength
        else
            p2 -= 1
        end
        puts p2 if p2 == 0
    end

    return true
end
