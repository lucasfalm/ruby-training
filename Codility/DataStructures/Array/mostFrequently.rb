a = [1,3,1,3,2,1]

most_frequent(a)

# Big O(N)
def most_frequent(array)
    mapValue = Hash.new(0)
    higher = 0

    array.each do |value|
        mapValue[value] += 1

        if mapValue[value] > higher
            higher = value
        end
    end

    return "None" if higher == 0
    return higher
end