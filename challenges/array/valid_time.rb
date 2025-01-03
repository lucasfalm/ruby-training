# frozen_string_literal: true

def validTime(time)
  aT = time.split('')
  h = (aT[0] + aT[1]).to_i
  m = (aT[3] + aT[4]).to_i

  return false if h > 23 || h.negative?
  return false if m > 59 || m.negative?

  true
end
