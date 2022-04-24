# frozen_string_literal: true

def permutation(stringA, _stringB)
  a1 = stringA.split('')
  a2 = stringA.split('')

  # If they have different lengths, it will not be permutation, so return
  return false if a1.count != a2.count

  puts 'not sorted'
  puts a1

  a1.sort!
  a2.sort!
  puts 'sorted'
  puts a1

  return false if a1 <=> a2

  true
end
