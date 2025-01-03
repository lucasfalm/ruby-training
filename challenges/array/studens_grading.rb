#!/bin/ruby
# frozen_string_literal: true

require 'json'
require 'stringio'

#
# Complete the 'gradingStudents' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts INTEGER_ARRAY grades as parameter.
#
# https://www.hackerrank.com/challenges/grading/problem

def gradingStudents(grades)
  final_grades = []

  grades.each do |grade|
    if grade < 38
      final_grades << grade
      next
    end

    digits = grade.to_s.split('')
    last_digit = digits.last.to_i

    final_grades << case last_digit
                    when 4, 9
                      grade + 1
                    when 3, 8
                      grade + 2
                    else
                      grade
                    end
  end
  final_gradess
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

grades_count = gets.strip.to_i

grades = Array.new(grades_count)

grades_count.times do |i|
  grades_item = gets.strip.to_i
  grades[i] = grades_item
end

result = gradingStudents grades

fptr.write result.join "\n"
fptr.write "\n"

fptr.close
