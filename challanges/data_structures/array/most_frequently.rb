# frozen_string_literal: true

a = [1, 3, 1, 3, 2, 1]

most_frequent(a)

# Big O(N)
def most_frequent(array)
  mapValue = Hash.new(0)
  higher = 0

  array.each do |value|
    mapValue[value] += 1

    higher = value if mapValue[value] > higher
  end

  return 'None' if higher.zero?

  higher
end
