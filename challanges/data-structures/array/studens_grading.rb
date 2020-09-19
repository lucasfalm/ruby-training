#!/bin/ruby

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
    final_grade = []

    grades.each do |grade|
        if grade < 38
            final_grade << grade
            next
        end

        digits = grade.to_s.split('')
        last_digit = (digits[digits.count - 1]).to_i

        if (last_digit == 4 || last_digit == 9)
            final_grade << grade + 1 
        elsif (last_digit == 3 || last_digit == 8)
            final_grade << grade + 2
        else
            final_grade << grade
        end
    end
    final_grade
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

fptr.close()
