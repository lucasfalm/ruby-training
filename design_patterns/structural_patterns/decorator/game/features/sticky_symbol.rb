# frozen_string_literal: true

module Features
  module StickySymbol

    def next_round last_round: nil, settings: {}
      super last_round: last_round,
            settings: settings

      settings[:sticky_simbols] = [0, 1, 5, 10]

      puts "Game::Features::StickySymbol#next_round with #{last_round}, #{settings}"
    end
  end
end
