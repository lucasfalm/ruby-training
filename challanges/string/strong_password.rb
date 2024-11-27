#
# NOTE: https://www.hackerrank.com/challenges/strong-password/problem?isFullScreen=true
#

NUMBERS = "0123456789"
SPECIAL_CHARACTERS = "!@#$%^&*()-+"
LOWERCASE_LETTERS = "abcdefghijklmnopqrstuvwxyz"
UPCASE_LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

def minimum_number(_n, password)
  minimum = 0
  minimum += 1 unless enough_digits?(password)
  minimum += 1 unless enough_upcase_characters?(password)
  minimum += 1 unless enough_downcase_characters?(password)
  minimum += 1 unless enough_special_characters?(password)

  until enough_length?(minimum + password.length)
    minimum += 1
  end

  minimum
end

def enough_length?(password)
  password.length >= 6
end

def enough_digits?(password)
  password.split('').any? { |char| NUMBERS.include?(char) }
end

def enough_upcase_characters?(password)
  password.split('').any? { |char| UPCASE_LETTERS.include?(char) }
end

def enough_downcase_characters?(password)
  password.split('').any? { |char| LOWERCASE_LETTERS.include?(char) }
end

def enough_special_characters?(password)
  password.split('').any? { |char| SPECIAL_CHARACTERS.include?(char) }
end
