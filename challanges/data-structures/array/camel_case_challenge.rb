# https://www.hackerrank.com/challenges/camelcase/problem
#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'camelcase' function below.
#
# The function is expected to return an INTEGER.
# The function accepts STRING s as parameter.
#

def camelcase(s)
    words = []
    # Write your code here
    
    s.split("").each do |letter|
        if letter == letter.upcase
            words << letter            
        else
            if words.last
                last_word = words.last
                last_word += letter
                words[words.size - 1] = last_word
            else
                words << letter
            end
        end
    end
    
    words.size
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.chomp

result = camelcase s

fptr.write result
fptr.write "\n"

fptr.close()

