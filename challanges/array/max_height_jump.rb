# frozen_string_literal: true

require 'json'
require 'stringio'

# https://www.hackerrank.com/challenges/the-hurdle-race/problem
# Complete the hurdleRace function below.
def hurdleRace(k, height)
  max_height = 0

  height.each do |h|
    actual_height = h.to_i

    max_height = actual_height if actual_height > max_height
  end

  return max_height - k if max_height > k

  0
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nk = gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

height = gets.rstrip.split(' ').map(&:to_i)

result = hurdleRace k, height

fptr.write result
fptr.write "\n"

fptr.close
