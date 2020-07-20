
a = [1,2,3,4,5]
b = [3,4,5,6,7,8,9,10]

commom_elements(a, b)

def commom_elements(arrayOne, arrayTwo)
    hashTable = Hash.new(0)
    commomElements = Array.new()

    arrayOne.each do |element|
        hashTable[element] += 1
    end

    arrayTwo.each do |element|
        commomElements << element if hashTable[element]
    end

    commomElements
end