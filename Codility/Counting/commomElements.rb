
arrayOne = [1,2,3,4,5]
arrayTwo = [3,4,5,6,7,8,9,10]

commom_elements(arrayOne, arrayTwo)

# Big O(n, m)
def commom_elements(arrayOne, arrayTwo)
    p1 = 0
    p2 = 0
    commomElements = Array.new()
    maxOne = arrayOne.count - 1
    maxTwo = arrayTwo.count - 1

    while p1 <= maxOne && p2 <= maxTwo do
        if arrayOne[p1] == arrayTwo[p2]
            commomElements << arrayOne[p1]
            p1 += 1
        elsif arrayOne[p1] < arrayTwo[p2]
            p1 += 1
        else
            p2 += 1
        end
    end

    commomElements
end
