# Link -> https://www.hackerrank.com/challenges/migratory-birds/problem
#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'migratoryBirds' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY arr as parameter.
#

def migratoryBirds(arr)

    birds_by_type_ids = {}
    
    max_bird = {
        id: 0,
        count: 0
    }
    
    second_max_bird = {
        id: 0,
        count: 0
    }

    min_bird = {
        id: 0,
        count: 0,
    }

    arr.uniq.each do |bird_id|
        id_count = arr.count(bird_id)
        birds_by_type_ids[bird_id] = id_count

        if id_count > max_bird[:count]
            max_bird = {
                id: bird_id,
                count: id_count
            }
        elsif id_count > second_max_bird[:count] && bird_id != max_bird[:id]
            second_max_bird = {
                id: bird_id,
                count: id_count
            }
        elsif id_count < min_bird[:count] && min_bird[:count] != 0
            min_bird = {
                id: bird_id,
                count: id_count
            }
        end
    end

    if max_bird[:count] == second_max_bird[:count]
        max_bird[:id] > second_max_bird[:id] ? second_max_bird[:id] : max_bird[:id]
    else
        max_bird[:id]
    end
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

arr_count = gets.strip.to_i

arr = gets.rstrip.split.map(&:to_i)

result = migratoryBirds arr

fptr.write result
fptr.write "\n"

fptr.close()

