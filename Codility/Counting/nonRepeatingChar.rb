
string = "aabbccd"
non_repeating(string)

# Big O(n)
def non_repeating(string)
    letters = string.split("")
    wordsMap = Hash.new(0)
    lastAlone = ""

    letters.each do |letter|
        wordsMap[letter] += 1

        if wordsMap[letter] % 2 != 0
            lastAlone = letter
        end
    end

    if wordsMap[lastAlone] % 2 == 0 
        return nil
    end

    lastAlone
end
