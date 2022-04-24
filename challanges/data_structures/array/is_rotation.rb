# frozen_string_literal: true

arrayOne = [1, 2, 3, 4, 5, 6, 7]
arrayTwo = [4, 5, 6, 7, 1, 2, 3]

is_rotation(arrayOne, arrayTwo)

# Big O(n)
def is_rotation(arrayOne, arrayTwo)
  maxLength = arrayOne.count - 1
  p1 = 0
  p2 = maxLength

  while p1 <= maxLength && p2 >= 0
    if arrayOne[p1] == arrayTwo[p2]
      p1 += 1
      p2 = maxLength
    else
      p2 -= 1
    end
    return false if p2.negative?
  end

  true
end
