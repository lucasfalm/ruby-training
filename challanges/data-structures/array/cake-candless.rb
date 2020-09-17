#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'birthdayCakeCandles' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY candles as parameter.
#

# https://www.hackerrank.com/challenges/birthday-cake-candles/problem
# Big O(n) time, and O(n) space complexity
def birthdayCakeCandles(candles)
   rank = Hash.new
   highest = 0 
   highest_value = 0

   candles.each do |number|
    rank[number] = 0 if !rank[number]
    rank[number] += 1
    
    if rank[number] >= highest_value
        highest = number
        highest_value = rank[number]
    end
   end

   rank[highest]
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

candles_count = gets.strip.to_i

candles = gets.rstrip.split.map(&:to_i)

result = birthdayCakeCandles candles

fptr.write result
fptr.write "\n"

fptr.close()
