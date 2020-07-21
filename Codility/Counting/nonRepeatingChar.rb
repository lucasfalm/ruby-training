
string = "aabbdbc"
non_repeating(string)

# Big O(n)
def non_repeating(string)
    letters = string.split("")
    lettersMap = Hash.new(0)
    lastAlone = ""

    letters.each do |letter|
        lettersMap[letter] += 1
    end

    lettersMap.each do |letter, value|
        if value % 2 != 0
            lastAlone = letter
            break
        end
    end

    if lettersMap[lastAlone] % 2 == 0 
        return nil
    end

    lastAlone    
end
