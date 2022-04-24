# frozen_string_literal: true

def gcd(a, b)
  return b if a.zero?
  return a if b.zero?

  gcd(b, a % b)
end

def gcdn(array, n)
  temp = array[0]
  i = 0

  while i <= n
    temp = gcd(temp, array[i])
    i += 1
  end

  temp
end
