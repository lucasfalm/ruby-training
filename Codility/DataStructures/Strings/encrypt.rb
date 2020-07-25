ascii = "test".chars.map { |c| c.ord }

shifted = ascii.map { |c| c + 5 }

shifted.map { |c| c.chr }.join