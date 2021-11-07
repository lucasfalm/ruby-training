
require 'json'
require 'stringio'

# https://www.hackerrank.com/challenges/plus-minus/problem
# Complete the plusMinus function below.
# Big O(n) time and O(1) space complexity
def plusMinus(arr)
    negatives = 0
    positives = 0
    zeros = 0

    arr.each do |number|
        negatives += 1 if number < 0
        positives += 1 if number > 0
        zeros += 1 if number == 0
    end

    negative_division_result = (negatives / arr.count.to_f).round(6)
    positives_division_result = (positives / arr.count.to_f).round(6)
    zeros_division_result = (zeros / arr.count.to_f).round(6)

    printf("%.6f\n", positives_division_result)
    printf("%.6f\n", negative_division_result)
    printf("%.6f\n", zeros_division_result)
end

n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

plusMinus arr
