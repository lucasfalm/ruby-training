require 'json'
require 'stringio'

# https://www.hackerrank.com/challenges/mini-max-sum/problem
# Complete the miniMaxSum function below.
def miniMaxSum(arr)
    arr.sort!
    min = 0
    max = 0
    counter_max = 1
    counter_min = 0

    while counter_min <= 3 do 
        max += arr[counter_max]
        min += arr[counter_min]
        counter_max += 1
        counter_min += 1
    end
    print "#{min} #{max}"
end

arr = gets.rstrip.split(' ').map(&:to_i)

miniMaxSum arr
