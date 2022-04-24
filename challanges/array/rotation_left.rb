# frozen_string_literal: true

# Big O(n) time and O(n) space
def rotate_left(a, d)
  counter = 1

  while counter <= d
    last = a.shift
    a.push(last)

    counter += 1
  end

  a
end
