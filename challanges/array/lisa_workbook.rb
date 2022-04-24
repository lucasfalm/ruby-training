# frozen_string_literal: true

# https://www.hackerrank.com/challenges/lisa-workbook/problem
# !/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'workbook' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER n
#  2. INTEGER k
#  3. INTEGER_ARRAY arr
#

# 5 3         n = 5, k = 3
# 4 2 6 1 10  arr = [4, 2, 6, 1, 10]
def workbook(_n, k, arr)
  max_per_page = k
  problems_per_chapter = arr

  final_book = []
  problems_per_chapter.each do |chapter_problem_count|
    page_problems = []
    last_problem = 0

    chapter_problem_count.times do
      if page_problems.size >= max_per_page
        final_book << page_problems
        page_problems = []
      end

      last_problem += 1
      page_problems << last_problem

      next unless last_problem == chapter_problem_count

      final_book << page_problems

      page_problems = []
      last_problem = 0
    end
  end

  result = []
  final_book.each_with_index do |book_page, index|
    result << book_page.include?(index)
  end

  result.count(true)
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

k = first_multiple_input[1].to_i

arr = gets.rstrip.split.map(&:to_i)

result = workbook n, k, arr

fptr.write result
fptr.write "\n"

fptr.close
