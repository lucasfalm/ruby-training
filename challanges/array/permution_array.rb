# frozen_string_literal: true

def solution(a)
  ok = 1
  notOk = 0
  original = a.clone

  # O(N) or O(N * log(N))
  if a.count.zero?
    notOk
  else
    return notOk if a.first <= 0 && a.last <= 0

    a.sort!.uniq!
    return notOk if a.count != original.count

    case a.count
    when 1
      if a.first == 1 && original.count == 1
        ok
      else
        notOk
      end
    when 2
      math = a.first - a.last

      if math == 1 || math == -1 && a.first == 1
        ok
      else
        notOk
      end
    else
      return notOk unless a.include?(1)

      last = a.first

      a.each do |actual|
        before = last
        last = actual

        next if last == -1 && actual == 1

        math =  actual - before

        return notOk if math >= 2 || math <= -2
      end
      ok
    end
  end
end
