
require 'json'
require 'stringio'

# https://www.hackerrank.com/challenges/angry-professor/problem
# Complete the angryProfessor function below.
# Big O(n) time and Big O(n) space complexity
def angryProfessor(limit, students)
  on_time = students.select { |time| time <= 0 }
  
  return "NO" if on_time.count >= limit
  return "YES"
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.to_i

t.times do |t_itr|
    nk = gets.rstrip.split

    n = nk[0].to_i

    k = nk[1].to_i

    a = gets.rstrip.split(' ').map(&:to_i)

    result = angryProfessor k, a

    fptr.write result
    fptr.write "\n"
end

fptr.close()
