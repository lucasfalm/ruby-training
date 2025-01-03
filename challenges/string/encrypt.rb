# frozen_string_literal: true

ascii = 'test'.chars.map(&:ord)

shifted = ascii.map { |c| c + 5 }

shifted.map(&:chr).join
