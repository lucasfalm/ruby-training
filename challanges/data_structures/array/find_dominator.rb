# frozen_string_literal: true

def solution(a)
  return -1 if a.count - 1 <= 1

  hashValues = Hash.new(0)
  dominator = 0
  indexDominator = 0
  maxValue = 0

  a.each_with_index do |v, i|
    hashValues[v] += 1
    if hashValues[v] > maxValue
      dominator = v
      maxValue = hashValues[v]
    end

    indexDominator = i if hashValues[v] == dominator
  end

  if hashValues[dominator] > (a.count - 1) / 2
    indexDominator
  else
    -1
  end
end
