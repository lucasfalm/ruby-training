# frozen_string_literal: true

# Big O(log n)
def isPalindrome(string)
  s = string.split('')
  size = s.count - 1
  counter = 0
  p1 = 0
  p2 = size

  while counter <= size / 2
    return false if s[p1] != s[p2]

    p1 += 1
    p2 -= 1
    counter += 1
    return true if counter > size / 2
  end
end
