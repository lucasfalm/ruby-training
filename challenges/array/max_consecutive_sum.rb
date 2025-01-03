# frozen_string_literal: true

# a = [3, 2, -1, 4, 5, -2]
def arrayMaxConsecutiveSum2(inputArray)
  max_so_far_evaluated = 0
  max_for_each_iteration = 0

  inputArray.each do |element|
    max_for_each_iteration += element
    max_for_each_iteration = 0 if max_for_each_iteration.negative?
    max_so_far_evaluated = max_for_each_iteration if max_so_far_evaluated < max_for_each_iteration
  end

  return -1 if max_so_far_evaluated.zero?

  max_so_far_evaluated
end
