#!/bin/ruby
# frozen_string_literal: true

require 'json'
require 'stringio'

# https://www.hackerrank.com/challenges/sparse-arrays/problem
def matchingStrings(strings, queries)
  result_hash = {}
  pointer_string = 0
  pointer_queries = 0

  while pointer_queries <= queries.count - 1
    current_string = strings[pointer_string]
    pointer_string += 1
    result_hash[current_string] = 0 if result_hash[current_string].nil?

    result_hash[current_string] += 1 if current_string === queries[pointer_queries]

    if pointer_string > strings.count - 1
      pointer_string = 0
      pointer_queries += 1
    end
  end
  counter = 0
  result = []

  while counter <= result_hash.count - 1
    result << if result_hash[queries[counter]].nil?
                0
              else
                result_hash[queries[counter]]
              end
    counter += 1
  end
  result
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

strings_count = gets.to_i

strings = Array.new(strings_count)

strings_count.times do |i|
  strings_item = gets.to_s.rstrip
  strings[i] = strings_item
end

queries_count = gets.to_i

queries = Array.new(queries_count)

queries_count.times do |i|
  queries_item = gets.to_s.rstrip
  queries[i] = queries_item
end

res = matchingStrings strings, queries

fptr.write res.join "\n"
fptr.write "\n"

fptr.close
