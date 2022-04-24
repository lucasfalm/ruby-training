# frozen_string_literal: true

require 'json'
require 'stringio'
# https://www.hackerrank.com/challenges/minimum-distances/problem
# Complete the minimumDistances function below.
def minimumDistances(a)
  array_size = a.count - 1

  return -1 if array_size < 1

  if array_size == 1
    return 1 if a[0] == a[1]

    return -1
  end

  min = 10 * 10**10
  start_pointer = 0
  end_pointer = array_size

  while start_pointer <= array_size
    if a[start_pointer] == a[end_pointer]
      distance = (start_pointer - end_pointer).abs

      min = distance if distance < min && (distance != 0)

      start_pointer += 1
      end_pointer = start_pointer + 1
    else
      end_pointer += 1
    end

    if end_pointer > array_size
      start_pointer += 1
      end_pointer = start_pointer + 1
    end
  end

  return -1 if min == 10 * 10**10

  min
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

a = gets.rstrip.split(' ').map(&:to_i)

result = minimumDistances a

fptr.write result
fptr.write "\n"

fptr.close
