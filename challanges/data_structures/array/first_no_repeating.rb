# frozen_string_literal: true

def firstNotRepeatingCharacter(s)
  a = s.split('')

  p0 = 0
  p1 = a.count
  first = ''

  while p0 <= a.count
    if a[p0] != a[p1]
      p1 -= 1
    elsif a[p0] == a[p1] && p0 != p1
      p0 += 1
      p1 = a.count
    elsif p0 == p1
      p1 -= 1
    elsif p0 == a.count
      p1 = a.count - 1
    end

    next unless p1.negative? || p0 > a.count
    return '_' if p0 >= a.count

    first = a[p0]
    return first
  end
  '_'
end
