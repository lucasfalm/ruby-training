
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

    negatives = (negatives / arr.count.to_f).round(6)
    positives = (positives / arr.count.to_f).round(6)
    zeros = (zeros / arr.count.to_f).round(6)

    printf("%.6f\n", positives)
    printf("%.6f\n", negatives)
    printf("%.6f\n", zeros)
end

n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

plusMinus arr
