# frozen_string_literal: true

def findLongestSubarrayBySum(s, arr)
  # if >, back p0 + 1

  max_so_far_evaluated = 0
  max_for_each_iteration = 0
  p0 = 0
  p1 = 0
  indexes_of_so_far_evaluated = Array.new(0)
  last_current_value = 0

  while p1 <= arr.count
    last_current_value = max_for_each_iteration
    max_for_each_iteration += arr[p1].to_i
    indexes_of_so_far_evaluated << p1 + 1

    if max_for_each_iteration == s
      if indexes_of_so_far_evaluated.count != 2
        start = indexes_of_so_far_evaluated.first
        ends = indexes_of_so_far_evaluated.last

        return [start, ends]
      end

      return indexes_of_so_far_evaluated

    elsif max_for_each_iteration < s && max_for_each_iteration >= last_current_value
      p1 += 1

    elsif max_for_each_iteration > s || max_for_each_iteration <= last_current_value
      max_so_far_evaluated = max_for_each_iteration
      p0 += 1
      p1 -= p0
      indexes_of_so_far_evaluated = Array.new(0)
      max_for_each_iteration = 0
    end
  end

  return -1 if indexes_of_so_far_evaluated.zero?

  indexes_of_so_far_evaluated
end
