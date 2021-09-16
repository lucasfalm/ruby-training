# https://www.hackerrank.com/challenges/kangaroo/problem

#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'kangaroo' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. INTEGER x1
#  2. INTEGER v1
#  3. INTEGER x2
#  4. INTEGER v2
#

def kangaroo(x1, v1, x2, v2)
    # Write your code here

    k1_positions = [x1]
    k2_positions = [x2]
    
    return "NO" if x1 < x2 && v1 < v2

    10000.times do
        k2_new_position = k2_positions.last + v2
        k1_new_position = k1_positions.last + v1

        return "YES" if k1_new_position == k2_new_position

        k1_positions << k1_new_position
        k2_positions << k2_new_position        
    end

    "NO"
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

x1 = first_multiple_input[0].to_i

v1 = first_multiple_input[1].to_i

x2 = first_multiple_input[2].to_i

v2 = first_multiple_input[3].to_i

result = kangaroo x1, v1, x2, v2

fptr.write result
fptr.write "\n"

fptr.close()
