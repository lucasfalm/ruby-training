#!/bin/ruby
# frozen_string_literal: true

require 'json'
require 'stringio'

# Complete the catAndMouse function below.
def catAndMouse(x, y, z)
  distance_from_cat_a = (z - x).abs
  distance_from_cat_b = (z - y).abs

  if distance_from_cat_a > distance_from_cat_b
    'Cat B'
  elsif distance_from_cat_a < distance_from_cat_b
    'Cat A'
  else
    'Mouse C'
  end
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

q.times do |_q_itr|
  xyz = gets.rstrip.split

  x = xyz[0].to_i

  y = xyz[1].to_i

  z = xyz[2].to_i

  result = catAndMouse x, y, z

  fptr.write result
  fptr.write "\n"
end

fptr.close
