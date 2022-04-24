# frozen_string_literal: true

def solution(a, b, k)
  return 0 if a == b

  isBig = false
  if k >= 1000 || b >= 1000
    a /= 10
    b /= 10
    k /= 10
    isBig = true
  end

  array = (a..b).to_a
  divisibles = 0

  array.each do |number|
    divisibles += 1 if (number % k).zero?
  end

  return divisibles * 10 if isBig

  divisibles
end
