# https://www.hackerrank.com/challenges/strange-code/problem
#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'strangeCounter' function below.
#
# The function is expected to return a LONG_INTEGER.
# The function accepts LONG_INTEGER t as parameter.
#

def strangeCounter(t)
    # Write your code here
    
    timer = [3, 2, 1]
    
    return timer[t - 1] if t <= timer.size

    steps_tracker = 0
    index_tracker = 0

    current_first_value = 3

    timers = [timer]

    while(steps_tracker <= t || index_tracker <= t) do
        new_current_first_value = current_first_value * 2
        new_timer = Array.new(new_current_first_value) { |i| i + 1 }.reverse

        timers << new_timer

        steps_tracker += timer.size
        index_tracker += timer.size

        timer = new_timer
        current_first_value = new_current_first_value
    end

    searched_timer = timers.find { |sub_timer| sub_timer.include?(t) }
    i = timers.find_index(searched_timer)
    sum_steps = timers.take(i + 1).map { |sub_timer| sub_timer.size }.sum

    by_step = searched_timer.find_index(t) + sum_steps + 1
    
    by_index = timers.flatten.find_index(t) + 1
    

    if by_step % by_index == 0
        by_index
    else
        print timers.flatten
        timers.flatten[t - 1]
    end
end


fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.strip.to_i

result = strangeCounter t

fptr.write result
fptr.write "\n"

fptr.close()

