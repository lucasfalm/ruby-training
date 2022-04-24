# frozen_string_literal: true

require 'json'
require 'stringio'

# https://www.hackerrank.com/challenges/compare-the-triplets/problem
# Complete the compareTriplets function below.
# Big O(n) time and Big O(1) space complexity
def compareTriplets(a, b)
  pointer_zero = 0
  player_one_result = 0
  player_two_result = 0

  while pointer_zero <= a.count - 1
    if a[pointer_zero] > b[pointer_zero]
      player_one_result += 1
    elsif a[pointer_zero] < b[pointer_zero]
      player_two_result += 1
    end
    pointer_zero += 1
  end

  [player_one_result, player_two_result]
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

a = gets.rstrip.split.map(&:to_i)

b = gets.rstrip.split.map(&:to_i)

result = compareTriplets a, b

fptr.write result.join ' '
fptr.write "\n"

fptr.close
