# frozen_string_literal: true

def top_k_frequent(words, k)
  return words if words.count.zero?

  h = Hash.new(0)

  words.each do |word|
    h[word] += 1
  end

  result = []
  i = 1

  h.each do |word, _key|
    result << word
    i += 1

    return result if i > k
  end
end
