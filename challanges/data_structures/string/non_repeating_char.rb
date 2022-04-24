# frozen_string_literal: true

string = 'aabbdbcdcb'
non_repeating(string)

# Big O(n)
def non_repeating(string)
  letters = string.split('')
  lettersMap = Hash.new(0)
  lastAlone = ''

  letters.each do |letter|
    lettersMap[letter] += 1
  end

  lettersMap.each do |letter, value|
    if value.odd?
      lastAlone = letter
      break
    end
  end

  return nil if lastAlone == ''

  lastAlone
end
