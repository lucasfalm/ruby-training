# frozen_string_literal: true

require 'byebug'

# NOTE: https://www.hackerrank.com/challenges/icecream-parlor/problem?isFullScreen=true
# 

def icecream_parlor(money, icecreams_costs)
  possible_icecreams = icecreams_costs.reject { |cost| cost >= money }

  pointer_zero = 0
  pointer_one  = 1

  final_icecreams = []

  while pointer_zero < possible_icecreams.size - 1 && pointer_one <= possible_icecreams.size - 1
    if possible_icecreams[pointer_zero] + possible_icecreams[pointer_one] == money
      final_icecreams << possible_icecreams[pointer_zero] << possible_icecreams[pointer_one]
      break
    end

    if pointer_one == possible_icecreams.size - 1
      pointer_zero += 1
      pointer_one   = pointer_zero + 1
      next
    end

    pointer_one += 1
  end

  cost_icecream_a, cost_icecream_b = final_icecreams
  index_icecream_a                 = icecreams_costs.find_index(cost_icecream_a)
  icecreams_costs.delete_at(index_icecream_a) if cost_icecream_a == cost_icecream_b

  index_icecream_b  = icecreams_costs.find_index(cost_icecream_b)
  index_icecream_b += 1 if cost_icecream_a == cost_icecream_b

  icecreams_positions = [index_icecream_a + 1, index_icecream_b + 1]
  icecreams_positions
end

money = 4
icecreams_costs = [
  1, 4, 5, 3, 2
]

# icecreams_costs = [2, 2, 4, 3]

icecream_parlor(money, icecreams_costs)