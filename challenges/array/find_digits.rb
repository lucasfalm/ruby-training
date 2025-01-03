#!/bin/ruby
# frozen_string_literal: true

require 'json'
require 'stringio'
# https://www.hackerrank.com/challenges/find-digits/problem
# Complete the findDigits function below.
# Big O(n) time, and O(n) space complexity
def findDigits(n)
  digits = n.to_s.split('')
  divisions = 0

  digits.each do |digit|
    next if digit.to_i.zero?

    divisions += 1 if (n % digit.to_i).zero?
  end

  divisions
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.to_i

t.times do |_t_itr|
  n = gets.to_i

  result = findDigits n

  fptr.write result
  fptr.write "\n"
end

fptr.close
